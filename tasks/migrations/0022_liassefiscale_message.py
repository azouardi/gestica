# Generated by Django 3.2.4 on 2021-11-06 08:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0021_auto_20211105_1211'),
    ]

    operations = [
        migrations.AddField(
            model_name='liassefiscale',
            name='message',
            field=models.TextField(blank=True, null=True, verbose_name='Message'),
        ),
    ]