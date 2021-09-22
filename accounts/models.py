import uuid
from ordres.models import LettreMission
from django.contrib.auth.models import User
from django.db import models

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE,null=True, verbose_name="Utilisateur")
    name = models.CharField(max_length=200, null=True, verbose_name="Nom et Prénom")
    phone = models.CharField(max_length=200, null=True, verbose_name="Phone")
    email = models.CharField(max_length=200, null=True, verbose_name="email")
    file = models.ImageField(verbose_name="Joindre Photo",upload_to='files/accounts/profiles', null=True, blank=True) # new
    date_created = models.DateTimeField(auto_now_add=True, null=True, verbose_name="Date création")
    
    def __str__(self):
        return str(self.name)

class Scope(models.Model):
    Scope = models.CharField(verbose_name="Scope", max_length=100, null=False, unique=True)

    def __str__(self):
        """return the name of Pays"""
        return self.Scope
   
class Portefolio(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    user = models.ForeignKey(Profile, null=True, on_delete= models.CASCADE,verbose_name="Collaborateur")   
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Mission", null=True)
    rolecollaborateur= models.ForeignKey(Scope, on_delete=models.SET_NULL, verbose_name="En charge de", null=True)
    active = models.BooleanField(verbose_name="Active sur le dossier", default = True)
    date_created = models.DateTimeField(auto_now_add=True, null=True, verbose_name="Date création")
    
    class Meta:
        unique_together = ['user', 'lettremission']
    
    def __str__(self):
        """return the name personne"""
        return str(self.user) +' / '+ str(self.lettremission)

class Validator(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    user = models.ForeignKey(Profile, null=True, on_delete= models.CASCADE,verbose_name="Collaborateur")   
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Mission", null=True)
    active = models.BooleanField(verbose_name="Active sur le dossier", default = True)
    date_created = models.DateTimeField(auto_now_add=True, null=True, verbose_name="Date création")
    
    class Meta:
        unique_together = ['user', 'lettremission']
    
    def __str__(self):
        """return the name personne"""
        return str(self.user) +' / '+ str(self.lettremission)


class PWSafe(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4,editable=False)
    user = models.ForeignKey(Profile, null=True, on_delete= models.SET_NULL,verbose_name="Collaborateur")   
    lettremission = models.ForeignKey(LettreMission, on_delete=models.SET_NULL, verbose_name="Mission", null=True)
    responsable = models.BooleanField(verbose_name="Responsable du dossier", default = True)
    active = models.BooleanField(verbose_name="Active sur le dossier", default = True)
    date_created = models.DateTimeField(auto_now_add=True, null=True, verbose_name="Date création")
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=50)

    
    class Meta:
        unique_together = ['username', 'lettremission']
    
    def __str__(self):
        """return the name personne"""
        return str(self.user) +' / '+ str(self.lettremission)