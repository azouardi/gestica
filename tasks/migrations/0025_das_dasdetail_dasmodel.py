# Generated by Django 3.2.4 on 2021-11-06 22:42

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('ordres', '0007_lettremission_nothosted'),
        ('tasks', '0024_tableliassefiscale_ecriture'),
    ]

    operations = [
        migrations.CreateModel(
            name='DAS',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('mois', models.IntegerField(choices=[(1, 'Janvier'), (2, 'Février'), (3, 'Mars'), (4, 'Avril'), (5, 'Mai'), (6, 'Juin'), (7, 'Juillet'), (8, 'Août'), (9, 'Septembre'), (10, 'Octobre'), (11, 'Novembre'), (12, 'Décembre')], default=12, verbose_name="Jusqu'au Mois")),
                ('statut', models.IntegerField(choices=[(0, 'En Cours'), (1, 'Traitée'), (2, 'Validée'), (3, 'Non-validée'), (4, 'Non Applicable')], default=0, verbose_name='Statut')),
                ('message', models.TextField(blank=True, null=True, verbose_name='Commentaire')),
                ('supervised', models.BooleanField(default=False, verbose_name='Supervisé')),
                ('exercice', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='tasks.exercice', verbose_name='Exercice')),
                ('lettremission', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ordres.lettremission', verbose_name='Lettre de Mission')),
            ],
        ),
        migrations.CreateModel(
            name='DASModel',
            fields=[
                ('code_rubrique', models.CharField(max_length=10, primary_key=True, serialize=False, verbose_name='Code Rubrique')),
                ('name_rubrique', models.CharField(max_length=150, verbose_name='Nom de la Rubrique')),
                ('text_sql', models.TextField(blank=True, null=True, verbose_name='SQL')),
                ('ordre', models.IntegerField(null=True, verbose_name='Ordre')),
            ],
        ),
        migrations.CreateModel(
            name='DASDetail',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('amount', models.FloatField(default=0, verbose_name='Valeur')),
                ('auto_genre', models.BooleanField(default=False, verbose_name='Compte Auto-Généré ?')),
                ('ordre', models.IntegerField(null=True, verbose_name='Ordre')),
                ('das', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tasks.das', verbose_name='Mois / Exercice')),
                ('dasmodel', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tasks.dasmodel', verbose_name='Rubrique')),
            ],
        ),
    ]
