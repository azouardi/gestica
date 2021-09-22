from ordres.models import LettreMission
import uuid
from django.db import models


class DocModel(models.Model):
    code_docmodel=models.CharField(max_length=3, verbose_name="Code", primary_key=True)
    name = models.CharField(max_length=100, verbose_name="Nom du Modèle")
    header = models.BooleanField(verbose_name="Entête de Page", default=False)
    footer = models.BooleanField(verbose_name="Pied de Page", default=False)
    file = models.ImageField(verbose_name="Joindre Image",upload_to='files/editions/models', null=True, blank=True) # new

    def __str__(self):
        """return the name"""
        return str(self.name)


class DocModelWord(models.Model):
    code_docmodel=models.ForeignKey(DocModel, on_delete=models.SET_NULL, verbose_name="Nom Modèle", null=True)
    ordre_parag = models.IntegerField(null=True,verbose_name="Ordre Paragraphe")
    class TypeParag(models.IntegerChoices):
        Titre = (1, 'Titre')
        Parag = (2, 'Paragraphe')
        run = (3,'Phrase / Mot')
    type_parag = models.IntegerField(null=True,verbose_name="Type Paragraphe", choices=TypeParag.choices, default=2)
    sort_parag = models.IntegerField(blank=True, null=True,verbose_name="Classement Titre (0 à 6)")
    size_font = models.DecimalField(decimal_places=2, max_digits=4, null=True,verbose_name="Taille du caractère", default=12)
    bold_font = models.BooleanField(verbose_name="Gras", default=False)
    italic_font = models.BooleanField(verbose_name="Italic", default=False)
    undeline_font = models.BooleanField(verbose_name="Surligner", default=False)
    space_after_parag = models.DecimalField(decimal_places=2, max_digits=4, null=True,verbose_name="Espace après", default=6)
    space_befor_parag = models.DecimalField(decimal_places=2, max_digits=4, null=True,verbose_name="Espace avant", default=3)
    class AlignmentParag(models.TextChoices):
        droite = ('right', 'Droite')
        center = ('center', 'Centre')
        gauche = ('left','Gauche')
        juist = ('justify', 'Justifié')

    alignment_parag = models.CharField(max_length=10,null=True,verbose_name="Alignement Paragraphe", choices=AlignmentParag.choices, default=4)
    ident_first_ligne = models.DecimalField(decimal_places=2, max_digits=4, null=True,verbose_name="Retrait Première Ligne", default=0)
    variable = models.BooleanField(verbose_name="Variable", default=False)
    texte = models.TextField(verbose_name="Text", null =True, blank=True)

    def __str__(self):
        """return the name"""
        return str(self.code_docmodel)


class SocialDoc(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Lettre de Mission", null=True)
    date_doc = models.DateTimeField(auto_now_add=True,verbose_name="Date Document")
    
    def __str__(self):
        """return the name of Nationalité"""
        return self.lettremission

class STC(models.Model):
    matricule = models.CharField(max_length=10, verbose_name='Matricule', null=False)
    month = models.IntegerField(verbose_name='Mois', null=False)
    year = models.IntegerField(verbose_name='Année', null=False)
    
    def __str__(self):
        return self.matricule
    