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
    code_benefit=models.ForeignKey(Benefit, on_delete=models.CASCADE, verbose_name="Particularité", null=True, blank=True)
    validator_manager = models.BooleanField(verbose_name="Validateur Manager ?", null=True, default=False)
    provisoire = models.BooleanField(verbose_name="Limitée dans le temps ?", null=True, default=False)
    echeance=models.DateField(verbose_name="Date limite d'application", null=True)
       
        
    def __str__(self):
        """return the name"""
        return str(self.name) +' ('+ str(self.code_task) +')'
    

class Work(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    period=models.ForeignKey(Period, on_delete=models.CASCADE, verbose_name="Echéance", null=True)
    date_limit=models.DateField(verbose_name="Date Limite")
    lettremission = models.ForeignKey(LettreMission, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)
    task = models.ForeignKey(Task, on_delete=models.CASCADE, verbose_name="Job to do", null=True)  
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
    lettremission = models.OneToOneField(LettreMission, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)

    def get_absolute_url(self):
        return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
    
    def __str__(self):
        """return the name"""
        return str(self.lettremission)


class BenefitItem(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    benefitlink=models.ForeignKey(BenefitLink, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)
    code_benefit=models.ForeignKey(Benefit, on_delete=models.CASCADE, verbose_name="Particularité", null=True)
    active=models.BooleanField(default=True, verbose_name="Active ?")
    date_start=models.DateField(verbose_name="Date début", null=True)
    numbre_add=models.IntegerField(verbose_name="Nombre à rajouter",null=True, blank=True,default=0)
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
    worklink = models.OneToOneField(Work, on_delete=models.CASCADE, verbose_name="Référence de la tâche", null=True)
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
    lettremission = models.ForeignKey(LettreMission, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)
    benefitlink = models.ForeignKey(BenefitLink, on_delete=models.CASCADE, verbose_name="Objet de la demande", null=True)
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
    lettremission = models.ForeignKey(LettreMission, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)
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
    complement=models.TextField(null=True, verbose_name="Commentaires / Travaux faits")
    file = models.FileField(verbose_name="Joindre une picèe",upload_to='files/claims/', blank=True)
    supervised = models.BooleanField(verbose_name="Supervisé", default=False)
    invoiced=models.BooleanField(verbose_name="Facturable ?", default=False)

    # def get_absolute_url(self):
    #     return reverse('tasks:companyTdb', kwargs={'pk': str(self.pk)})
    def __str__(self):
        """return the name"""
        return str(self.objet) +' ('+ str(self.date_start) +'/'+ str(self.lettremission) +')'

class Exercice(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    exercice=models.CharField(max_length=4, verbose_name= "Exercice", null=False)
    intermediate=models.BooleanField(verbose_name="Situation Intermédiaire ?", default=False)
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
    month = models.IntegerField(verbose_name="Jusqu'au Mois", choices=Month.choices, default=12, null=True)
    date_creation=models.DateField(auto_now_add=True, verbose_name="Date")
    class Meta:
        unique_together = ['exercice', 'month']
        
    def get_absolute_url(self):
        return reverse('tasks:exerciceList')
    
    def __str__(self):
        """return the name"""
        return str(self.exercice) +'/ mois:'+str(self.month) +' (intermédiaire: '+str(self.intermediate)+')'

   
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
        passagerf = (1,'Passage au Résultat Fiscal')
        deficit = (2,'Imputation Déficites')
        report = (3,'Déficites Reportables')
        rcha = (4,'Résultat Courant Hors Amortissement')
        rf = (5,'Résultat Fiscal')
        ventilrf = (6,'Ventilation du bénéfice net fiscal')
        acomptes = (7,'Acomptes versés')
        rel_exc = (8,'Calcul Reliquat ou Excédent')
        acomptesn1 = (9,'Acomptes Provisionnel N+1')
        etat_deficit = (10,'Etat Explicatif Déficit ou Résultat Nul')
        etat_ventes = (11,'Etat des ventes par client')
        liasse = (12,'Etat Entreprises Encouragées')
        basecm = (13,'Rubriques base de CM')
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
    class Sql(models.IntegerChoices):
        bet = (0,'BETWEEN')
        like = (1,'LIKE')
        cust = (3,'CUSTUM')
    sql = models.IntegerField(verbose_name="SQL ?", choices=Sql.choices, default=0)
    sql_text = models.TextField(verbose_name="SQL Personalisé", null=True, blank=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.name_account) +' ('+ str(self.code_account) +')'   

class AccountBis(models.Model):
    code_account = models.CharField(max_length=20, primary_key=True, verbose_name="Code")
    name_account = models.CharField(max_length=100, verbose_name="Libellé")
    class Rubrique(models.IntegerChoices):
        commun = (0,'Commun')
        passagerf = (1,'Passage au Résultat Fiscal')
        deficit = (2,'Imputation Déficites')
        report = (3,'Déficites Reportables')
        rcha = (4,'Résultat Courant Hors Amortissement')
        rf = (5,'Résultat Fiscal')
        ventilrf = (6,'Ventilation du bénéfice net fiscal')
        acomptes = (7,'Acomptes versés')
        rel_exc = (8,'Calcul Reliquat ou Excédent')
        acomptesn1 = (9,'Acomptes Provisionnel N+1')
        etat_deficit = (10,'Etat Explicatif Déficit ou Résultat Nul')
        etat_ventes = (11,'Etat des ventes par client')
        liasse = (12,'Etat Entreprises Encouragées')
        basecm = (13,'Rubriques base de CM')
    taxreturn = models.IntegerField(verbose_name="Rubrique Déclaration Fiscal", choices=Rubrique.choices, default=0, blank=True)
    class Exer(models.IntegerChoices):
        Ex_n = (0,'Exercice N (en Cours)')
        Ex_n1 = (1,'Exercice N-1')
        Ex_n2 = (2,'Exercice N-2')
        Ex_n3 = (3,'Exercice N-3')
        Ex_n4 = (4,'Exercice N-4')
    exercice = models.IntegerField(verbose_name="Quel Exercice ?", choices=Exer.choices, default=0)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.name_account) +' ('+ str(self.code_account) +')'   


class Situation(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    exercice = models.ForeignKey(Exercice, on_delete=models.CASCADE, verbose_name="Exercice", null=True)
    lettremission = models.ForeignKey(LettreMission, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)
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
    exempt_is = models.BooleanField(verbose_name="Exonération d'IS Export/CFC", default=False)
    date_exempt_is=models.DateField(verbose_name="Date Fin Exonération d'IS Export/CFC", null=True, blank=True)
    exempt_cm = models.BooleanField(verbose_name="Exonération CM", default=False)
    date_exempt_cm=models.DateField(verbose_name="Date Fin Exonération CM", null=True, blank=True)
    exempt_tp = models.BooleanField(verbose_name="Exonération TP", default=False)
    date_exempt_tp=models.DateField(verbose_name="Date Fin Exonération TP", null=True, blank=True)
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
    deduc_reint = models.IntegerField(verbose_name="Déduction ou Réintégration", choices=DedReint.choices, null=True, blank=True)
    class Nature(models.IntegerChoices):
        court = (0,'Courant')
        No_cour = (1,'Non Courant')
    nature = models.IntegerField(verbose_name="Nature", choices=Nature.choices, null=True, blank=True)
    amount = models.FloatField(verbose_name="Montant", default=0)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    code_account = models.CharField(max_length=20, verbose_name="Code Post / Compte", null=True, blank=True)
    class Rubrique(models.IntegerChoices):
        commun = (0,'Commun')
        passagerf = (1,'Passage au Résultat Fiscal')
        deficit = (2,'Imputation Déficites')
        report = (3,'Déficites Reportables')
        rcha = (4,'Résultat Courant Hors Amortissement')
        rf = (5,'Résultat Fiscal')
        ventilrf = (6,'Ventilation du bénéfice net fiscal')
        acomptes = (7,'Acomptes versés')
        rel_exc = (8,'Calcul Reliquat ou Excédent')
        acomptesn1 = (9,'Acomptes Provisionnel N+1')
        etat_deficit = (10,'Etat Explicatif Déficit ou Résultat Nul')
        etat_ventes = (11,'Etat des ventes par client')
        liasse = (12,'Etat Entreprises Encouragées')
    taxreturn = models.IntegerField(verbose_name="Rubrique Déclaration Fiscal", choices=Rubrique.choices, default=0, blank=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
     
    def __str__(self):
        """return the name"""
        return str(self.rubrique) +' ('+ str(self.situation) +')'
    
class CotisationMinimal(models.Model):
    situation = models.ForeignKey(Situation, on_delete=models.CASCADE, verbose_name="Exercice")
    rubrique = models.CharField(max_length=100, verbose_name="Rubrique")
    class Regime(models.IntegerChoices):
        Reint = (0,'Imposable 100%')
        Deduc = (1,'Exonération 100%')
    regime = models.IntegerField(verbose_name="Imposition ou Exonération", choices=Regime.choices, default=0)
    base = models.FloatField(verbose_name="Base de la CM", default=0)
    TAXE_CHOICES=[
        (4.5/1000,'0,45%'),
        (5/1000,'0,5%'),
        (6/1000,'0,6%'),
        (0/100,'0%'),
    ]
    taux = models.FloatField(verbose_name="Taux CM", choices=TAXE_CHOICES, default=5/1000)
    amount = models.FloatField(verbose_name="Montant de la CM", default=0)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    code_account = models.CharField(max_length=20, verbose_name="Code Post / Compte", null=True, blank=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
     
    def __str__(self):
        """return the name"""
        return str(self.rubrique) +' ('+ str(self.situation) +')'
    
class TableLiasseFiscale(models.Model):
    code_table = models.CharField(max_length=10, primary_key=True, verbose_name="Code Table")
    name_table = models.CharField(max_length=150, verbose_name="Nom de la table")
    text_controle = models.TextField(verbose_name="Description de la Vérification", null=True, blank=True)
    text_sql = models.TextField(verbose_name="SQL Valeur Vérifiée", null=True, blank=True)
    tolerance = models.FloatField(verbose_name="Seuil de tolérence", default=0)
    ecriture = models.BooleanField(verbose_name="GL / écritures comptables ?", default=False)
    text_KO = models.TextField(verbose_name="Message Echéc", null=True, blank=True)
    text_OK = models.TextField(verbose_name="Message Succès", null=True, blank=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.code_table) +' ('+ str(self.name_table) +')'
class LiasseFiscale(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    situation = models.ForeignKey(Situation, on_delete=models.CASCADE, verbose_name="Exercice")
    tableliassefiscale = models.ForeignKey(TableLiasseFiscale, on_delete=models.CASCADE, verbose_name="Table Liasse Fiscale")
    amount_1 = models.FloatField(verbose_name="Valeur à Vérifier", default=0)
    amount_2 = models.FloatField(verbose_name="Valeur de Référence", default=0)
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        InChecked = (3,'Non-validée')
        NonApplicable = (4,'Non Applicable')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    message = models.TextField(verbose_name="Message", null=True, blank=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
     
    def __str__(self):
        """return the name"""
        return str(self.tableliassefiscale) +' ('+ str(self.situation) +')'    

class ImpotSociete(models.Model):
    situation = models.ForeignKey(Situation, on_delete=models.CASCADE, verbose_name="Exercice")
    class Benefice(models.IntegerChoices):
        norm = (0,'Progressif Normal')
        plaf = (1,'Progressif Plafoné')
        prop = (2,'Proportionnel')
        exo = (3,'Exonéré')
    pourcentage = models.FloatField(verbose_name="Pourcentage", default=0)
    benefice = models.IntegerField(verbose_name="Bénéfice", choices=Benefice.choices, default=0)
    base = models.FloatField(verbose_name="Base de l'Impôt ", default=0)
    taux = models.FloatField(verbose_name="Taux de l'Impôt", default=0)
    deduction = models.FloatField(verbose_name="Montant à Déduire", default=0)
    amount = models.FloatField(verbose_name="Montant de l'Impôt", default=0)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
     
    def __str__(self):
        """return the name"""
        return str(self.situation) +' (IS)'

class BaremeImpot(models.Model):
    class Impot(models.IntegerChoices):
        IS = (0,'IS')
        IR = (1,'IR')
        CSS = (2,'CSS')
        CFC = (3,'CFC')
        CFC2020 = (4,'CFC2020')
    impot = models.IntegerField(verbose_name="Impôt", choices=Impot.choices, default=0)
    plancher = models.FloatField(verbose_name="Plancher", default=0)
    plafond = models.FloatField(verbose_name="Plafond", default=0)
    taux = models.FloatField(verbose_name="Taux", default=0)
    montant_a_deduire = models.FloatField(verbose_name="Montant à Déduire", default=0)
    a_partir_du = models.DateField(verbose_name="A Partir de :", null=True, blank=True)
    jusqu_au = models.DateField(verbose_name="Jusqu'au :", null=True, blank=True)
    taux_specifique = models.BooleanField(verbose_name="Taux Spécifique?", default=False)
     
    def __str__(self):
        """return the name"""
        return str(self.impot) +' ('+str(self.taux)+')'

class DAS(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    exercice = models.ForeignKey(Exercice, on_delete=models.CASCADE, verbose_name="Exercice", null=True)
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
        
    month = models.IntegerField(verbose_name="Jusqu'au Mois", choices=Month.choices, null=False, default=12)    
    lettremission = models.ForeignKey(LettreMission, on_delete=models.CASCADE, verbose_name="Lettre de Mission", null=True)
    date_start=models.DateField(verbose_name="Date début",null=True)
    date_closing=models.DateField(verbose_name="Date clôture",null=True)
    date_declaration=models.DateField(verbose_name="Date limite déclaration",null=True)
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Cours')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        InChecked = (3,'Non-validée')
        NonApplicable = (4,'Non Applicable')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
    message = models.TextField(verbose_name="Commentaire", null=True, blank=True)
    supervised = models.BooleanField(verbose_name="Supervisé", default=False)    
    class Meta:
        unique_together = ['exercice', 'lettremission']    
    def __str__(self):
        """return the name"""
        return str(self.month)+'/'+str(self.exercice) +' ('+ str(self.lettremission) +')'
    
    
class DASModel(models.Model):
    code_rubrique = models.CharField(max_length=10, primary_key=True, verbose_name="Code Rubrique")
    name_rubrique = models.CharField(max_length=150, verbose_name="Nom de la Rubrique")
    text_sql = models.TextField(verbose_name="SQL", null=True, blank=True)
    class Type(models.IntegerChoices):
        bp = (0,'Bulletin')
        das = (1,'Etat DAS')
        gl = (2,'Ecritures Comptable')
        perso = (3,'Personalisé')
    type = models.IntegerField(verbose_name="Type table", choices=Type.choices, default=0)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.code_rubrique) +' ('+ str(self.name_rubrique) +')'
    
class DASDetail(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    das = models.ForeignKey(DAS, on_delete=models.CASCADE, verbose_name="Mois / Exercice")
    dasmodel = models.ForeignKey(DASModel, on_delete=models.CASCADE, verbose_name="Rubrique")
    amount = models.FloatField(verbose_name="Valeur", default=0)
    coherence = models.BooleanField(verbose_name="Eléments Cohérents ?", default=False)    
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
     
    def __str__(self):
        """return the name"""
        return str(self.dasmodel) +' ('+ str(self.das) +')'
    
class DASMatriculeDetail(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    das = models.ForeignKey(DAS, on_delete=models.CASCADE, verbose_name="Mois / Exercice")
    matricule = models.CharField(max_length=10,verbose_name="Matricule", null=True)
    sbg = models.FloatField(verbose_name="SBG", default=0)
    exonere = models.FloatField(verbose_name="Eléments Exonérés", default=0)
    sbi = models.FloatField(verbose_name="SBI", default=0)
    fp = models.FloatField(verbose_name="Frais Professionnels", default=0)
    taux_fp = models.FloatField(verbose_name="Taux FP", default=0)
    retenues = models.FloatField(verbose_name="Retenues", default=0)
    logneco = models.FloatField(verbose_name="Logement Non Eco", default=0)
    logeco = models.FloatField(verbose_name="Logement Eco", default=0)
    retcomp = models.FloatField(verbose_name="Retraite Complémentaire", default=0)
    deduction = models.FloatField(verbose_name="Déductions", default=0)
    njt = models.FloatField(verbose_name="Nombre Jours Travaillée", default=0)
    imposable_ir= models.BooleanField(verbose_name="Soumis à l'IR ?", default=True)    
    taux_fixe_ir = models.FloatField(verbose_name="Taux Fixe IR", default=0)
    class Categorie(models.IntegerChoices):
        per = (1,'Permament')
        perexo = (4,'Permanent Exonéré')
        stag = (2,'Stagaire')
        occ = (3,'Occasionnel')
    categorie = models.IntegerField(verbose_name="Catégorie", choices=Categorie.choices, default=0)
    ir = models.FloatField(verbose_name="IR versé", default=0)
    ir_reconstitue = models.FloatField(verbose_name="IR Reconstitué", default=0)
    coherence = models.BooleanField(verbose_name="Eléments Cohérents ?", default=False)    
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
     
    def __str__(self):
        """return the name"""
        return str(self.matricule) +' ('+ str(self.das) +')'

class DASEXOModel(models.Model):
    code_rubrique = models.CharField(max_length=15, primary_key=True, verbose_name="Code Rubrique")
    name_rubrique = models.CharField(max_length=300, verbose_name="Nom de la Rubrique")
    class Type(models.IntegerChoices):
        forf = (0,'Forfait')
        just = (1,'Sur Justificatif')
        perc = (2,'Pourcentage avec plafond')
        percsp = (3,'Pourcentage')
    type = models.IntegerField(verbose_name="Type Rubrique", choices=Type.choices, default=0)
    class Periodicite(models.IntegerChoices):
        forf = (0,'Mensuelle')
        just = (1,'Annuelle')
        perc = (2,'Unique')
    periodicite = models.IntegerField(verbose_name="Périodicité Rubrique", choices=Periodicite.choices, default=0)
    value = models.FloatField(verbose_name="Valeur", default=0)
    taux = models.FloatField(verbose_name="Pourcentage", default=0)
    base_rubrique = models.CharField(max_length=150, verbose_name="Rubrique Base du Plafond", null=True, blank=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.code_rubrique) +' ('+ str(self.name_rubrique) +')'

class DASMatriculeExo(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    das = models.ForeignKey(DAS, on_delete=models.CASCADE, verbose_name="Mois / Exercice")
    matricule = models.CharField(max_length=10,verbose_name="Matricule", null=True)
    code_rubrique = models.CharField(max_length=15, verbose_name="Code Rubrique", null=True)
    amount = models.FloatField(verbose_name="Valeur", default=0)
    coherence = models.BooleanField(verbose_name="Eléments Cohérents ?", default=False)    
    comment = models.TextField(verbose_name="Commentaire", null=True, blank=True)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.matricule) +' ('+ str(self.das) +')'

class DASMatriculeFIPP(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    das = models.ForeignKey(DAS, on_delete=models.CASCADE, verbose_name="Mois / Exercice")
    matricule = models.CharField(max_length=10,verbose_name="Matricule", null=True)
    nom = models.CharField(max_length=100, verbose_name="Nom", null=True)
    prenom = models.CharField(max_length=100, verbose_name="Prénom", null=True)
    adresse = models.CharField(max_length=300, verbose_name="Adresse", null=True)
    ville = models.CharField(max_length=100, verbose_name="Ville", null=True)
    cin = models.CharField(max_length=15, verbose_name="CIN", null=True)
    datenaissance = models.DateField(verbose_name="Date Naissance", null=True)
    class Genre(models.IntegerChoices):
        hom = (1,'Homme')
        fem = (2,'Femme')
    sexe = models.IntegerField(verbose_name="Genre", choices=Genre.choices, null=True, blank=True)
    situationfam = models.CharField(max_length=300, verbose_name="Situation Familiale", null=True)
    deduction= models.CharField(max_length=300, verbose_name="Nombre Déductions", null=True)
    cnss = models.CharField(max_length=300, verbose_name="Numéro CNSS", null=True)
    tauxfp = models.CharField(max_length=300, verbose_name="Taux FP", null=True)
    coherence = models.BooleanField(verbose_name="Eléments Cohérents ?", default=False)    
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.matricule) +' ('+ str(self.das) +')'
    
class DASMatriculeCSS(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    das = models.ForeignKey(DAS, on_delete=models.CASCADE, verbose_name="Mois / Exercice")
    matricule = models.CharField(max_length=10,verbose_name="Matricule", null=True)
    css = models.FloatField(verbose_name="Montant CSS", default=0)
    css_regul = models.FloatField(verbose_name="Montant Régul CSS", default=0)
    amount_base = models.FloatField(verbose_name="Base Calculée", default=0)
    amount_theo = models.FloatField(verbose_name="Valeur Calculée", default=0)
    ecart = models.FloatField(verbose_name="Ecart", default=0)
    coherence = models.BooleanField(verbose_name="Eléments Cohérents ?", default=False)    
    class Categorie(models.IntegerChoices):
        per = (1,'Permament')
        perexo = (4,'Permanent Exonéré')
        stag = (2,'Stagaire')
        occ = (3,'Occasionnel')
    categorie = models.IntegerField(verbose_name="Catégorie", choices=Categorie.choices, default=0)
    comment = models.TextField(verbose_name="Commentaire", null=True, blank=True)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    
    def __str__(self):
        """return the name"""
        return str(self.matricule) +' ('+ str(self.das) +')'