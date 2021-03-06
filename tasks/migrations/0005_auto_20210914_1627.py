# Generated by Django 3.2.4 on 2021-09-14 15:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0004_auto_20210914_1624'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='benefit',
            name='frequency',
        ),
        migrations.RemoveField(
            model_name='benefit',
            name='numbre_add',
        ),
        migrations.AddField(
            model_name='benefititem',
            name='frequency',
            field=models.IntegerField(choices=[(1, 'Unique'), (2, 'Mois'), (3, 'Trim'), (4, 'Sems'), (5, 'Annuel')], null=True, verbose_name='Fréquence'),
        ),
        migrations.AddField(
            model_name='benefititem',
            name='numbre_add',
            field=models.IntegerField(blank=True, null=True, verbose_name='Nombre à rajouter'),
        ),
    ]
