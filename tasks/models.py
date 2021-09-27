from ordres.models import LettreMission
from django.urls.base import reverse
import uuid
from django.db import models

# Create your models here.

class Period(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    period=models.CharField(max_length=6, verbose_name= "Période", unique=True, null=False)
    echeance=models.DateField(verbose_name="Echéance")
    
    def get_absolute_url(self):
        return reverse('tasks:periodDetail', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.period) +' ('+ str(self.echeance) +')'
    

class Benefit(models.Model):
    code_benefit=models.CharField(max_length=3, verbose_name="Code", primary_key=True)
    name = models.CharField(max_length=200, verbose_name="Particularité")
    
    def __str__(self):
        """return the name"""
        return str(self.name) +' ('+ str(self.code_benefit) +')'
    
class Task(models.Model):
    code_task=models.CharField(max_length=3, verbose_name= "Code Tâche", unique=True, null=False, primary_key=True)
    name = models.CharField(max_length=150, null=False, verbose_name="Designation de la Tâche")
    class Category(models.IntegerChoices):
        TVA = (1, 'TVA')
        IS = (2, 'IS')
        IR = (3, 'IR')
        Taxe = (4, 'Taxe')
        Contribution = (5, 'Cotisation')
        Report = (6, 'Rapport')

    category=models.IntegerField(verbose_name="Catégorie", null=False,choices=Category.choices)
    class AddToDate(models.IntegerChoices):
        d = (1, 'Day')
        m = (2, 'Month')
        y = (3, 'Year')
    to_add=models.IntegerField(verbose_name="Ajouter à la Date", null=True,choices=AddToDate.choices)
    numbre_add=models.IntegerField(verbose_name="Nombre à rajouter",null=True)
    class Frequency(models.IntegerChoices):
        u = (1, 'Unique')
        m = (2, 'Mois')
        t = (3,'Trim')
        s = (4, 'Sems')
        y = (5, 'Annuel')
    frequency=models.IntegerField(verbose_name="Fréquence", null=True, choices=Frequency.choices)
    year_civil = models.BooleanField(verbose_name="Année Civile ?", null=True, default=False)
    repeted = models.BooleanField(verbose_name="Récurrent ?", null=True, default=False)
    specific = models.BooleanField(verbose_name="Spécifique ?", null=True, default=False)
    class PersonType(models.IntegerChoices):
        pm = (1, 'Société Commerciale')
        pp = (2, 'Entreprise Personnelle')
        ass = (3,'Association')
        part = (4,'Particulier')
        aut = (5,'Commun')
    persontype=models.IntegerField(verbose_name="Type de la Personne", null=True, choices=PersonType.choices)
    code_benefit=models.ForeignKey(Benefit, on_delete=models.SET_NULL, verbose_name="Particularité", null=True, blank=True)
       
        
    def __str__(self):
        """return the name"""
        return str(self.name) +' ('+ str(self.code_task) +')'
    

class Work(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    period=models.ForeignKey(Period, on_delete=models.CASCADE, verbose_name="Echéance", null=True)
    date_limit=models.DateField(verbose_name="Date Limite")
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)
    task = models.ForeignKey(Task, on_delete=models.SET_NULL, verbose_name="Job to do", null=True)  
    value = models.FloatField(verbose_name="Valeur", null=True, default=0)
    proof = models.CharField(max_length=200, verbose_name="N° Quittance", null=True, blank=True)
    
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        InChecked = (3,'Non-validée')
        NonApplicable = (4,'Non Applicable')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    file = models.FileField(verbose_name="Joindre Quittance",upload_to='files/tasks/', blank=True)
    supervised = models.BooleanField(verbose_name="Supervisé", default=False)
    class Meta:
        unique_together = ['period', 'lettremission', 'task']
        
    # def get_absolute_url(self):
    #     return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
       
    def __str__(self):
        """return the name"""
        return str(self.task) +' ('+ str(self.lettremission) +')'

    
class BenefitLink(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    lettremission = models.OneToOneField(LettreMission, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)

    def get_absolute_url(self):
        return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.lettremission)


class BenefitItem(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    benefitlink=models.ForeignKey(BenefitLink, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)
    code_benefit=models.ForeignKey(Benefit, on_delete=models.SET_NULL, verbose_name="Particularité", null=True)
    active=models.BooleanField(default=True, verbose_name="Active ?")
    date_start=models.DateField(verbose_name="Date début", null=True)
    numbre_add=models.IntegerField(verbose_name="Nombre à rajouter",null=True, blank=True)
    class Frequency(models.IntegerChoices):
        u = (1, 'Unique')
        m = (2, 'Mois')
        t = (3,'Trim')
        s = (4, 'Sems')
        y = (5, 'Annuel')
    frequency=models.IntegerField(verbose_name="Fréquence", null=True, choices=Frequency.choices,blank=True)
    
    class Meta:
        unique_together = ['benefitlink', 'code_benefit']        
    def __str__(self):
        """return the name"""
        return str(self.code_benefit)


class BenefitRequested(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    worklink = models.OneToOneField(Work, on_delete=models.SET_NULL, verbose_name="Référence de la tâche", null=True)
    amountrequested=models.FloatField(null=True, verbose_name="Mondant Demandé")
    amountreceived=models.FloatField(null=True, verbose_name="Mondant Remboursé")
    
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        NonApplicable = (3,'Non Applicable')
    
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    complement=models.CharField(max_length=200, null=True, verbose_name="Complément")
    
    
    def get_absolute_url(self):
        return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.worklink)


class VATRequested(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)
    benefitlink = models.ForeignKey(BenefitLink, on_delete=models.SET_NULL, verbose_name="Objet de la demande", null=True)
    year=models.IntegerField(verbose_name="Exercice")
    class Month(models.IntegerChoices):
        Janvier = (1,'Janvier')
        Février = (2,'Février')
        Mars = (3,'Mars')
        Avril =(4, 'Avril')
        Mai = (5, 'Mai')
        Juin = (6, 'Juin')
        Juillet = (7, 'Juillet')
        Août = (8, 'Août')
        Septembre = (9, 'Septembre')
        Octobre = (10, 'Octobre')
        Novembre = (11, 'Novembre')
        Décembre = (12, 'Décembre')
    month = models.IntegerField(verbose_name="Mois", choices=Month.choices, null=False)
    amountrequested=models.FloatField(null=True, verbose_name="Mondant Demandé")
    amountreceived=models.FloatField(null=True, verbose_name="Mondant Remboursé")
    
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        NonApplicable = (3,'Non Applicable')
    
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    complement=models.CharField(max_length=200, null=True, verbose_name="Complément")
    
    class Meta:
        unique_together = ['lettremission', 'benefitlink']
    
    def get_absolute_url(self):
        return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.lettremission) +' ('+ str(self.month) +'/'+ str(self.year) +')'


class Claim(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)
    objet = models.CharField(max_length=200, null=True, verbose_name="Objet de la réclamation")
    date_start=models.DateField(auto_now_add=True, verbose_name="Date de la réclamation")
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Déposée')
        Accepted = (2,'Accordée')
        Rejected = (3,'Rejetée')  
        Canceled = (4,'Annulée')  
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    date_end=models.DateField(verbose_name="Date de clôture", null=True, blank=True)
    complement=models.TextField(null=True, verbose_name="Commentaire")
    invoiced=models.BooleanField(verbose_name="Facturable ?", default=False)

    # def get_absolute_url(self):
    #     return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
    def __str__(self):
        """return the name"""
        return str(self.objet) +' ('+ str(self.date_start) +'/'+ str(self.lettremission) +')'

class Exercice(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    exercice=models.CharField(max_length=4, verbose_name= "Exercice", unique=True, null=False)
    date_creation=models.DateField(auto_now_add=True, verbose_name="Date")
    
    def get_absolute_url(self):
        return reverse('tasks:exerciceDetail', kwargs={'pk': str(self.pk)})
    def __str__(self):
        """return the name"""
        return str(self.exercice)

   
class Account(models.Model):
    code_account = models.CharField(max_length=20, primary_key=True, verbose_name="Code Post / Compte")
    name_account = models.CharField(max_length=100, verbose_name="Libellé du Compte")
    class Nature(models.IntegerChoices):
        court = (0,'Courant')
        No_cour = (1,'Non Courant')
    nature = models.IntegerField(verbose_name="Nature", choices=Nature.choices, default=0)
    class DedReint(models.IntegerChoices):
        Reint = (0,'Réintégration')
        Deduc = (1,'Déduction')
    deduc_reint = models.IntegerField(verbose_name="Déduction ou Réintégration", choices=DedReint.choices, default=0)
    class Rubrique(models.IntegerChoices):
        commun = (0,'Commun')
        resultat = (1,'Résultat Fiscal')
        deficit = (2,'Imputation Déficites')
        report = (3,'Déficites Reportables')
        decl = (4,'Déclaration')
    taxreturn = models.IntegerField(verbose_name="Rubrique Déclaration Fiscal", choices=Rubrique.choices, default=0, blank=True)
    class Sens(models.IntegerChoices):
        Debit = (0,'Débit')
        Done = (1,'Crédit')
    sens = models.IntegerField(verbose_name="Sens", choices=Sens.choices)
    account_lower = models.CharField(max_length=10, verbose_name="Compte Inférieure")
    account_upper = models.CharField(max_length=10, verbose_name="Compte Supérieure")
    class Exer(models.IntegerChoices):
        Ex_n = (0,'Exercice N (en Cours)')
        Ex_n1 = (1,'Exercice N-1')
        Ex_n2 = (2,'Exercice N-2')
        Ex_n3 = (3,'Exercice N-3')
        Ex_n4 = (4,'Exercice N-4')
    exercice = models.IntegerField(verbose_name="Quel Exercice ?", choices=Exer.choices, default=0)
    class Sens(models.IntegerChoices):
        Debit = (0,'BETWEEN')
        Done = (1,'LIKE')
    sql = models.IntegerField(verbose_name="SQL ?", choices=Sens.choices, default=0)
    
    def __str__(self):
        """return the name"""
        return str(self.name_account) +' ('+ str(self.code_account) +')'   


class Situation(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    exercice = models.ForeignKey(Exercice, on_delete=models.CASCADE, verbose_name="Exercice", null=True)
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)
    date_start=models.DateField(verbose_name="Date début")
    date_closing=models.DateField(verbose_name="Date clôture")
    numbre_month =models.IntegerField(verbose_name="Nombre de mois")
    date_declaration=models.DateField(verbose_name="Date limite déclaration")
    date_ago=models.DateField(verbose_name="Date limite AGO")
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        InChecked = (3,'Non-validée')
        NonApplicable = (4,'Non Applicable')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    supervised = models.BooleanField(verbose_name="Supervisé", default=False)
     
    def get_absolute_url(self):
        return reverse('tasks:exerciceDetail', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.exercice) +' ('+ str(self.lettremission) +')'

    
class TaxReturn(models.Model):
    situation = models.ForeignKey(Situation, on_delete=models.CASCADE, verbose_name="Exercice")
    rubrique = models.CharField(max_length=100, verbose_name="Rubrique")
    class DedReint(models.IntegerChoices):
        Reint = (0,'Réintégration')
        Deduc = (1,'Déduction')
    deduc_reint = models.IntegerField(verbose_name="Déduction ou Réintégration", choices=DedReint.choices, default=0)
    class Nature(models.IntegerChoices):
        court = (0,'Courant')
        No_cour = (1,'Non Courant')
    nature = models.IntegerField(verbose_name="Nature", choices=Nature.choices)
    Amount = models.FloatField(verbose_name="Montant", default=0)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    code_account = models.CharField(max_length=20, verbose_name="Code Post / Compte", null=True, blank=True)
           
    def __str__(self):
        """return the name"""
        return str(self.rubrique) +' ('+ str(self.situation) +')'