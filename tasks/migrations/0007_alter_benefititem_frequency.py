# Generated by Django 3.2.4 on 2021-09-16 10:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0006_alter_work_period'),
    ]

    operations = [
        migrations.AlterField(
            model_name='benefititem',
            name='frequency',
            field=models.IntegerField(blank=True, choices=[(1, 'Unique'), (2, 'Mois'), (3, 'Trim'), (4, 'Sems'), (5, 'Annuel')], null=True, verbose_name='Fréquence'),
        ),
    ]
