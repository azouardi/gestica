# Generated by Django 3.2.4 on 2021-11-19 13:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0037_dasmatriculeexo'),
    ]

    operations = [
        migrations.AddField(
            model_name='dasexomodel',
            name='base_rubrique',
            field=models.CharField(blank=True, max_length=150, null=True, verbose_name='Rubrique Base du Plafond'),
        ),
        migrations.AddField(
            model_name='dasexomodel',
            name='taux',
            field=models.FloatField(default=0, verbose_name='Pourcentage'),
        ),
        migrations.AlterField(
            model_name='dasexomodel',
            name='type',
            field=models.IntegerField(choices=[(0, 'Forfait'), (1, 'Sur Justificatif'), (2, 'Pourcentage avec plafond'), (3, 'Pourcentage')], default=0, verbose_name='Type Rubrique'),
        ),
    ]
