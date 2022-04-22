# Generated by Django 3.2.4 on 2021-11-15 09:54

from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0010_auto_20210913_1844'),
    ]

    operations = [
        migrations.CreateModel(
            name='BlackList',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('codedb', models.TextField(null=True, verbose_name='Code Base Donnée')),
                ('office', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='customers.office', verbose_name='Cabinet')),
            ],
            options={
                'unique_together': {('codedb', 'office')},
            },
        ),
    ]
