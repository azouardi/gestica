import uuid
from django.db import models
from django.urls.base import reverse
from customers.models import Company, Office, Prospect

class ModuleService(models.Model):
    moduleservice = models.CharField(max_length=200, verbose_name="Nom du Module", null=False, unique=True)

    def __str__(self):
        """return a string representation of the service"""
        return f"{self.moduleservice}"

class Service(models.Model):
    moduleservice = models.ForeignKey(ModuleService, on_delete=models.SET_NULL, null=True)
    service = models.CharField(max_length=100, verbose_name="Service", null=False, unique=True)
    text = models.CharField(max_length=300,verbose_name="Désignation du Service", null=True)

    class Meta:
        unique_together = ['moduleservice', 'service']
        
    def __str__(self):
        """return a string representation of the service"""
        return self.text +' ('+self.service+')'

class ServiceDescription(models.Model):
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, null=True)
    text = models.CharField(max_length=300,verbose_name="Description du Service", null=True)

    class Meta:
        unique_together = ['text', 'service']
        
    def __str__(self):
        """return a string representation of the service"""
        return self.text
    
class Outlay(models.Model):
    moduleservice = models.ForeignKey(ModuleService, on_delete=models.SET_NULL, null=True)
    outlay = models.CharField(max_length=100, verbose_name="Débours", null=False, unique=True)
    text = models.CharField(max_length=300,verbose_name="Désignation du Débours", null=True)
    class Meta:
        unique_together = ['moduleservice', 'outlay']
        
    def __str__(self):
        """return a string representation of the service"""
        return self.outlay

class LettreMission(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    reference = models.CharField(verbose_name="Référence de la LDM", max_length=50, null=False, unique=True)
    company = models.ForeignKey(Company, on_delete=models.SET_NULL, verbose_name="Raison Sociale", null=True)
    office = models.ForeignKey(Office, on_delete=models.SET_NULL, verbose_name= "Cabinet", null=True)
    moduleservice = models.ForeignKey(ModuleService, on_delete=models.SET_NULL, verbose_name="Abonnée aux Services", null=True)
    db_office = models.CharField(max_length=10, verbose_name="Code Dossier", null=True)
    nothosted = models.BooleanField(verbose_name="Sans Database ?", default=False)
    entry_date = models.DateField(verbose_name="Date d'Entrée", null=False)
    terminate = models.BooleanField(verbose_name="LDM Résiliée ?", default=False)
    leave_date = models.DateField(verbose_name="Date de Départ", null=True, blank=True)
    file = models.FileField(verbose_name="Joindre LDM",upload_to='files/ldms/', blank=True) # new
    
    def get_absolute_url(self):
        return reverse('ordres:lettremissionDetail', kwargs={'pk': str(self.pk)})
    
    class Meta:
        unique_together = ['office', 'company','moduleservice']
    
    def __str__(self):
        """return the name"""
        return str(self.company) +' / LDM: '+ str(self.moduleservice)


class Ordre(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    company = models.ForeignKey(Company, on_delete=models.SET_NULL, verbose_name="Raison Sociale", null=True)
    office = models.ForeignKey(Office, on_delete=models.SET_NULL, verbose_name= "Cabinet", null=True)
    ordre_date = models.DateField(verbose_name="Date de commande", null=False)
    comment = models.CharField(max_length=200, verbose_name="Commentaire", null=True)
    class Statut(models.IntegerChoices):
        InApprobal = 0, ('En Approbation')
        InProcess = 1, ('En Cours')
        Terminate = 2, ('Terminée')
        Invoiced = 4, ('Facturée')
        Canceled = 3, ('Annulée')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    file = models.FileField(verbose_name="Joindre Devis",upload_to='files/ordres/', blank=True) # new

    def get_absolute_url(self):
        return reverse('ordres:ordreDetail', kwargs={'pk': str(self.pk)})
    
    class Meta:
        verbose_name_plural='ordres'
    
    def __str__(self):
        """return the name"""
        return str(self.company) +' ('+ str(self.office) +')'

class ServiceItem(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    ordre = models.ForeignKey(Ordre, on_delete=models.CASCADE, verbose_name="Commande", null=True)
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, verbose_name= "Service", null=True)
    quantity = models.FloatField(verbose_name="Quantité", null=True, default=1)
    amount = models.FloatField(verbose_name="Honoraires HT", null=True, default=0)
    
    TAXE_CHOICES=[
        (20/100,'20%'),
        (14/100,'14%'),
        (10/100,'10%'),
        (7/100,'7%'),
        (0/100,'0%'),
    ]
    taxe = models.FloatField(verbose_name="Taux TVA", choices=TAXE_CHOICES, default=20/100)
    
    def get_absolute_url(self):
        return reverse('ordres:updateServiceItem', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the Service Items"""
        return str(self.service) +' ('+ str(self.ordre) +')'

class OutlayItem(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    ordre = models.ForeignKey(Ordre, on_delete=models.CASCADE, verbose_name="Commande", null=True)
    outlay = models.ForeignKey(Outlay, on_delete=models.SET_NULL, verbose_name= "Débours", null=True)
    quantity = models.FloatField(verbose_name="Quantité", null=True, default=1)
    amount = models.FloatField(verbose_name="Montant Débours", null=True, default=0)

    def get_absolute_url(self):
        return reverse('ordres:updateOutlayItem', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.outlay) +' ('+ str(self.ordre) +')'
    

class LettreMissionLink(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    prospect = models.ForeignKey(Prospect, on_delete=models.SET_NULL, verbose_name="Prospect", null=True)
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Mission", null=True)
    date_recrutement = models.DateTimeField(verbose_name="Date", auto_now=True)
    
    class Meta:
        unique_together = ['prospect', 'lettremission']
           
    def __str__(self):
        """return the name of Représentant PM"""
        return str(self.lettremission)
