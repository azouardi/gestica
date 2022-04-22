# Generated by Django 3.2.4 on 2021-11-07 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0027_das_date_declaration'),
    ]

    operations = [
        migrations.AddField(
            model_name='dasmodel',
            name='statut',
            field=models.IntegerField(choices=[(0, 'Bulletin'), (1, 'Etat SAS'), (2, 'Ecritures Comptable')], default=0, verbose_name='Type table'),
        ),
    ]
