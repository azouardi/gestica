# Generated by Django 3.2.4 on 2021-08-20 12:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('editions', '0007_auto_20210820_1300'),
    ]

    operations = [
        migrations.AlterField(
            model_name='docmodelword',
            name='alignment_parag',
            field=models.IntegerField(choices=[(1, 'Droite'), (2, 'Centre'), (3, 'Gauche'), (4, 'Justifié')], default=4, null=True, verbose_name='Alignement Paragraphe'),
        ),
    ]
