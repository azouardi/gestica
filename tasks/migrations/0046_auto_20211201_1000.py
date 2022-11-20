# Generated by Django 3.2.4 on 2021-12-01 09:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0045_claim_file'),
    ]

    operations = [
        migrations.AddField(
            model_name='claim',
            name='supervised',
            field=models.BooleanField(default=False, verbose_name='Supervisé'),
        ),
        migrations.AlterField(
            model_name='claim',
            name='complement',
            field=models.TextField(null=True, verbose_name='Commentaires / Travaux faits'),
        ),
    ]