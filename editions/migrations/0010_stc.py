# Generated by Django 3.2.4 on 2021-08-26 15:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('editions', '0009_alter_docmodelword_alignment_parag'),
    ]

    operations = [
        migrations.CreateModel(
            name='STC',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('matricule', models.CharField(max_length=10, verbose_name='Matricule')),
                ('month', models.IntegerField(verbose_name='Mois')),
                ('year', models.IntegerField(verbose_name='Année')),
            ],
        ),
    ]
