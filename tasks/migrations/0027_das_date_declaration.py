# Generated by Django 3.2.4 on 2021-11-07 13:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0026_auto_20211107_1433'),
    ]

    operations = [
        migrations.AddField(
            model_name='das',
            name='date_declaration',
            field=models.DateField(null=True, verbose_name='Date limite déclaration'),
        ),
    ]