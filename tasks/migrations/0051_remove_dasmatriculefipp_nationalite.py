# Generated by Django 3.2.4 on 2021-12-17 09:19

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0050_alter_dasmatriculedetail_categorie'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dasmatriculefipp',
            name='nationalite',
        ),
    ]