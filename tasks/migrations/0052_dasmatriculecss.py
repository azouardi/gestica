# Generated by Django 3.2.4 on 2021-12-20 09:54

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0051_remove_dasmatriculefipp_nationalite'),
    ]

    operations = [
        migrations.CreateModel(
            name='DASMatriculeCSS',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('matricule', models.CharField(max_length=10, null=True, verbose_name='Matrcule')),
                ('css', models.FloatField(default=0, verbose_name='Montant CSS')),
                ('amount_base', models.FloatField(default=0, verbose_name='Base Calculée')),
                ('amount_theo', models.FloatField(default=0, verbose_name='Valeur Calculée')),
                ('ecart', models.FloatField(default=0, verbose_name='Ecart')),
                ('coherence', models.BooleanField(default=False, verbose_name='Eléments Cohérents ?')),
                ('comment', models.TextField(blank=True, null=True, verbose_name='Commentaire')),
                ('auto_genre', models.BooleanField(default=False, verbose_name='Compte Auto-Généré ?')),
                ('ordre', models.IntegerField(null=True, verbose_name='Ordre')),
                ('das', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tasks.das', verbose_name='Mois / Exercice')),
            ],
        ),
    ]