# Generated by Django 3.2.4 on 2021-10-01 11:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0012_auto_20211001_1145'),
    ]

    operations = [
        migrations.RenameField(
            model_name='taxreturn',
            old_name='Amount',
            new_name='amount',
        ),
        migrations.RemoveField(
            model_name='accountbis',
            name='deduc_reint',
        ),
        migrations.RemoveField(
            model_name='accountbis',
            name='nature',
        ),
        migrations.AlterField(
            model_name='accountbis',
            name='taxreturn',
            field=models.IntegerField(blank=True, choices=[(0, 'Commun'), (1, 'Passage au Résultat Fiscal'), (2, 'Imputation Déficites'), (3, 'Déficites Reportables'), (4, 'Résultat Courant Hors Amortissement'), (5, 'Résultat Fiscal'), (6, 'Ventilation du bénéfice net fiscal'), (7, 'Acomptes versés'), (8, 'Calcul Reliquat ou Excédent'), (9, 'Acomptes Provisionnel N+1'), (10, 'Etat Explicatif Déficit ou Résultat Nul'), (11, 'Etat des ventes par client'), (12, 'Etat Entreprises Encouragées')], default=0, verbose_name='Rubrique Déclaration Fiscal'),
        ),
        migrations.AlterField(
            model_name='taxreturn',
            name='taxreturn',
            field=models.IntegerField(blank=True, choices=[(0, 'Commun'), (1, 'Passage au Résultat Fiscal'), (2, 'Imputation Déficites'), (3, 'Déficites Reportables'), (4, 'Résultat Courant Hors Amortissement'), (5, 'Résultat Fiscal'), (6, 'Ventilation du bénéfice net fiscal'), (7, 'Acomptes versés'), (8, 'Calcul Reliquat ou Excédent'), (9, 'Acomptes Provisionnel N+1'), (10, 'Etat Explicatif Déficit ou Résultat Nul'), (11, 'Etat des ventes par client'), (12, 'Etat Entreprises Encouragées')], default=0, verbose_name='Rubrique Déclaration Fiscal'),
        ),
        migrations.CreateModel(
            name='CotisationMinimal',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rubrique', models.CharField(max_length=100, verbose_name='Rubrique')),
                ('regime', models.IntegerField(choices=[(0, 'Imposable 100%'), (1, 'Exonéré 100%')], default=0, verbose_name='Déduction ou Réintégration')),
                ('base', models.FloatField(default=0, verbose_name='Base de la CM')),
                ('taux', models.FloatField(choices=[(0.005, '0,5%'), (0.006, '0,6%'), (0.0, '0%')], default=0.005, verbose_name='Taux CM')),
                ('amount', models.FloatField(default=0, verbose_name='Montant de la CM')),
                ('auto_genre', models.BooleanField(default=False, verbose_name='Compte Auto-Généré ?')),
                ('code_account', models.CharField(blank=True, max_length=20, null=True, verbose_name='Code Post / Compte')),
                ('ordre', models.IntegerField(null=True, verbose_name='Ordre')),
                ('situation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tasks.situation', verbose_name='Exercice')),
            ],
        ),
    ]