# Generated by Django 3.2.4 on 2021-09-21 15:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0008_account_dataaccount_exercice_situation'),
    ]

    operations = [
        migrations.AddField(
            model_name='situation',
            name='statut',
            field=models.IntegerField(choices=[(0, 'En Cours'), (1, 'Traitée'), (2, 'Validée'), (3, 'Non-validée'), (4, 'Non Applicable')], default=0, verbose_name='Statut'),
        ),
        migrations.AddField(
            model_name='situation',
            name='supervised',
            field=models.BooleanField(default=False, verbose_name='Supervisé'),
        ),
    ]
