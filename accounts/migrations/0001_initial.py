# Generated by Django 3.2.4 on 2021-07-08 15:46

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('ordres', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Scope',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Scope', models.CharField(max_length=100, unique=True, verbose_name='Scope')),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, null=True, verbose_name='Nom et Prénom')),
                ('phone', models.CharField(max_length=200, null=True, verbose_name='Phone')),
                ('email', models.CharField(max_length=200, null=True, verbose_name='email')),
                ('file', models.ImageField(blank=True, null=True, upload_to='files/accounts/profiles', verbose_name='Joindre Photo')),
                ('date_created', models.DateTimeField(auto_now_add=True, null=True, verbose_name='Date création')),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Utilisateur')),
            ],
        ),
        migrations.CreateModel(
            name='Portefolio',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('active', models.BooleanField(default=True, verbose_name='Active sur le dossier')),
                ('date_created', models.DateTimeField(auto_now_add=True, null=True, verbose_name='Date création')),
                ('lettremission', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='ordres.lettremission', verbose_name='Mission')),
                ('rolecollaborateur', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='accounts.scope', verbose_name='En charge de')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='accounts.profile', verbose_name='Collaborateur')),
            ],
            options={
                'unique_together': {('user', 'lettremission')},
            },
        ),
    ]