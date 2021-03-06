# Generated by Django 3.2.4 on 2021-07-31 18:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('editions', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='docmodelword',
            name='bold_font',
            field=models.BooleanField(default=False, verbose_name='Gras'),
        ),
        migrations.AddField(
            model_name='docmodelword',
            name='undeline_font',
            field=models.BooleanField(default=False, verbose_name='Surligner'),
        ),
        migrations.AddField(
            model_name='docmodelword',
            name='variable',
            field=models.BooleanField(default=False, verbose_name='Variable'),
        ),
    ]
