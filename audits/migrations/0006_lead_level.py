# Generated by Django 3.2.4 on 2021-10-31 16:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('audits', '0005_alter_accountlead_section'),
    ]

    operations = [
        migrations.AddField(
            model_name='lead',
            name='level',
            field=models.IntegerField(blank=True, null=True, verbose_name='Niveau du Compte'),
        ),
    ]
