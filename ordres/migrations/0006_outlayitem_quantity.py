# Generated by Django 3.2.4 on 2021-08-25 17:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ordres', '0005_serviceitem_quantity'),
    ]

    operations = [
        migrations.AddField(
            model_name='outlayitem',
            name='quantity',
            field=models.FloatField(default=1, null=True, verbose_name='Quantité'),
        ),
    ]
