# Generated by Django 3.2.4 on 2021-11-06 09:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0023_auto_20211106_1038'),
    ]

    operations = [
        migrations.AddField(
            model_name='tableliassefiscale',
            name='ecriture',
            field=models.BooleanField(default=False, verbose_name='GL / écritures comptables ?'),
        ),
    ]
