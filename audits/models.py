import uuid
from django.db import models

from tasks.models import Situation

# Create your models here.

class GLVersion(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    situation = models.ForeignKey(Situation, on_delete=models.CASCADE, verbose_name="Exercice")
    date_edition=models.DateField(auto_now_add=True, verbose_name="Date Edition", null=True)
    closing = models.BooleanField(verbose_name="Version Définitive ?", default=False)
    
    def __str__(self):
        return str(self.situation) +'/' + str(self.date_edition)

class GeneralLedger(models.Model):
    glversion= models.ForeignKey(GLVersion, on_delete=models.CASCADE, verbose_name="Grand Livre")
    journal = models.CharField(max_length=10, verbose_name="Journal")
    num_piece = models.CharField(max_length=10, verbose_name="Numéro Pièce", null=True, blank=True)
    date_entry=models.DateField(verbose_name="Date Ecriture")
    account = models.CharField(max_length=14,  verbose_name="Compte")
    designation = models.CharField(max_length=200,  verbose_name="Désignation", null=True, blank=True)
    debit = models.FloatField(verbose_name="Débit", null=True, blank=True)
    credit = models.FloatField(verbose_name="Crédit", null=True, blank=True)
    reference = models.CharField(max_length=20,  verbose_name="Référence", null=True, blank=True)
    lettrage = models.CharField(max_length=20,  verbose_name="Lettrage", null=True, blank=True)

    def __str__(self):
        return str(self.glversion) +'/' + str(self.account)
    
class SectionModel(models.Model):
    code_section = models.CharField(max_length=2, primary_key=True, verbose_name="Code Section")
    name_section = models.CharField(max_length=100, verbose_name="Nom Section")
    class Type(models.IntegerChoices):
        cpc = (0,'CPC')
        bilan = (1,'Bilan')
    type = models.IntegerField(verbose_name="Type de Section", choices=Type.choices, default=0)
    def __str__(self):
        return str(self.name_section)


class Section(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    section = models.ForeignKey(SectionModel, on_delete=models.CASCADE, verbose_name="Section")
    situation = models.ForeignKey(Situation, on_delete=models.CASCADE, verbose_name="Situation")
    date_generation=models.DateField(verbose_name="Date", null=True)
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Rédaction')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        InChecked = (3,'Non-validée')
        NonApplicable = (4,'Non Applicable')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)    
    supervised = models.BooleanField(verbose_name="Supervisé", default=False)
    class Meta:
        unique_together = ['situation', 'section']    

    def __str__(self):
        return str(self.section)
    
class Conclusion(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    class Type(models.IntegerChoices):
        revue_a = (0,'Revue Analytique')
        risque = (1,'Risque - Point d''attention')
        reco = (2,'Recommandation')
        conc = (3,'Conclusion')
    type = models.IntegerField(verbose_name="Type de Conclusion", choices=Type.choices, default=0)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, verbose_name="Section")
    conclusion = models.TextField(blank=True, verbose_name="Texte", null=True)
    class Statut(models.IntegerChoices):
        InProcess = (0,'En Rédaction')
        Done = (1,'Traitée')
        Checked = (2,'Validée')
        InChecked = (3,'Non-validée')
        NonApplicable = (4,'Non Applicable')
    statut = models.IntegerField(verbose_name="Statut", choices=Statut.choices, default=0)
           
    def __str__(self):
        return str(self.section)

class AccountLead(models.Model):
    code_account = models.CharField(max_length=10, primary_key=True, verbose_name="Code Post / Compte")
    name_account = models.CharField(max_length=100, verbose_name="Libellé du Compte")
    class Level(models.IntegerChoices):
        clas = (1,'Calsse')
        rubr = (2,'Rubrique')
        post = (3,'Poste')
        compte = (4,'Compte')
        sscompte = (5,'Sous-Compte')
    level = models.IntegerField(verbose_name="Niveau du Compte", choices=Level.choices, default=4)
    section = models.ForeignKey(SectionModel, on_delete=models.CASCADE, verbose_name="Section", null=True, blank=True)
    class Sens(models.IntegerChoices):
        Debit = (0,'Débit')
        Credit = (1,'Crédit')
    sens = models.IntegerField(verbose_name="Sens", choices=Sens.choices)
    class Nature(models.IntegerChoices):
        bilan = (0,'Bilan')
        cpc = (1,'CPC')
    nature = models.IntegerField(verbose_name="Nature", choices=Nature.choices)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
        
    def __str__(self):
        return str(self.code_account)

class Lead(models.Model):
    section = models.ForeignKey(Section, on_delete=models.CASCADE, verbose_name="Section", null=True)
    xRef = models.CharField(max_length=10, verbose_name="X-Référence", null=True, blank=True)
    code_account = models.ForeignKey(AccountLead, on_delete=models.CASCADE, verbose_name="Code Post / Compte")
    data_n = models.FloatField(verbose_name="Valeur N", default=0, null=True)
    data_n1 = models.FloatField(verbose_name="Valeur N-1", default=0, null=True)
    data_delta = models.FloatField(verbose_name="Variation", default=0, null=True)
    data_delta_pc = models.FloatField(verbose_name="Pourcentage", default=0, null=True)
    ordre = models.IntegerField(verbose_name="Ordre", null=True)
    auto_genre = models.BooleanField(verbose_name="Compte Auto-Généré ?", default=False)
    
    def __str__(self):
        return str(self.code_account)