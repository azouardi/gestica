# Generated by Django 3.2.4 on 2021-08-19 18:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('editions', '0004_auto_20210819_1741'),
    ]

    operations = [
        migrations.AddField(
            model_name='docmodel',
            name='file',
            field=models.ImageField(blank=True, null=True, upload_to='files/editions/models', verbose_name='Joindre Photo'),
        ),
    ]
