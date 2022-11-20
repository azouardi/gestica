# Generated by Django 3.2.4 on 2021-11-15 11:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0011_blacklist'),
    ]

    operations = [
        migrations.CreateModel(
            name='CompanyTemps',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('insert', models.BooleanField(default=False, verbose_name='Ajouter à la Fiche Société ?')),
                ('database', models.CharField(max_length=3, verbose_name='Code BD Société')),
                ('name', models.CharField(max_length=100, unique=True, verbose_name='Raison Sociale')),
                ('adresse', models.TextField(max_length=300, null=True, verbose_name='Adresse')),
                ('code_postal', models.CharField(max_length=50, null=True, verbose_name='Code Postal')),
                ('city', models.CharField(max_length=100, verbose_name='Ville')),
                ('national_law', models.BooleanField(default=True, verbose_name='De Droit National ?')),
                ('ice', models.CharField(blank=True, max_length=15, null=True, verbose_name='ICE')),
                ('identifiant_fiscal', models.CharField(blank=True, max_length=10, null=True, verbose_name='Identifiant Fiscal')),
                ('cnss', models.CharField(blank=True, max_length=10, null=True, verbose_name='Num Affiliation CNSS')),
                ('rc', models.CharField(blank=True, max_length=10, null=True, verbose_name='Num Registre de Commerce')),
                ('tp', models.CharField(blank=True, max_length=10, null=True, verbose_name='Num Taxe Professionnelle')),
                ('activity', models.TextField(max_length=300, null=True, verbose_name='Activité')),
                ('fiscal_year', models.IntegerField(choices=[(1, 'Janvier'), (2, 'Février'), (3, 'Mars'), (4, 'Avril'), (5, 'Mai'), (6, 'Juin'), (7, 'Juillet'), (8, 'Août'), (9, 'Septembre'), (10, 'Octobre'), (11, 'Novembre'), (12, 'Décembre')], default=1, verbose_name="Mois d'Ouverture Année Fiscale")),
                ('create_date', models.DateField(blank=True, null=True, verbose_name='Date de Création')),
                ('share_capital', models.FloatField(blank=True, verbose_name='Capital Social')),
                ('nominal_value', models.FloatField(blank=True, verbose_name='Valeur Nominale')),
                ('statut', models.IntegerField(choices=[(0, 'En Attente'), (1, 'Actif'), (2, 'Suspendu'), (3, 'InActif')], default=0, verbose_name='Statut')),
                ('terminate_date', models.DateField(blank=True, null=True, verbose_name='Date de Cessation/Dissolution')),
                ('liquidation_date', models.DateField(blank=True, null=True, verbose_name='Date de Liquidation')),
                ('country', models.ForeignKey(default='212', null=True, on_delete=django.db.models.deletion.SET_NULL, to='customers.country', verbose_name='Pays')),
                ('currency', models.ForeignKey(default='MAD', null=True, on_delete=django.db.models.deletion.SET_NULL, to='customers.currency', verbose_name='Devise')),
                ('legal_form', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='customers.legalform', verbose_name='Forme Juridique')),
                ('nationality', models.ForeignKey(blank=True, default='212', null=True, on_delete=django.db.models.deletion.SET_NULL, to='customers.nationality', verbose_name='Nationalité')),
            ],
        ),
    ]