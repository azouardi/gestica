from django.db import models

# Create your models here.

class Csv(models.Model):
    file_name=models.FileField(verbose_name="Nom fichier", upload_to='files/csvs') # new
    uploaded = models.DateTimeField(auto_now_add=True)
    activated = models.BooleanField(default=False)

    def __str__(self):
        return str(self.file_name)