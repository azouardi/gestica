# Generated by Django 3.2.4 on 2021-07-24 17:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0003_alter_company_city'),
        ('ordres', '0001_initial'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='lettremission',
            unique_together={('office', 'company', 'moduleservice')},
        ),
    ]
