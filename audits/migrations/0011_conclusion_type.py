# Generated by Django 3.2.4 on 2021-11-02 14:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('audits', '0010_alter_conclusion_conclusion'),
    ]

    operations = [
        migrations.AddField(
            model_name='conclusion',
            name='type',
            field=models.IntegerField(choices=[(0, 'Revue Analytique'), (1, 'Risque - Point dattention'), (2, 'Recommandation'), (3, 'Conclusion')], default=0, verbose_name='Type de Conclusion'),
        ),
    ]
