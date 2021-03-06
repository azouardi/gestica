# Generated by Django 3.2.4 on 2021-12-03 09:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('customers', '0015_alter_office_company'),
        ('accounts', '0007_alter_profile_office'),
    ]

    operations = [
        migrations.AlterField(
            model_name='manager',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='accounts.profile', verbose_name='Manager'),
        ),
        migrations.AlterField(
            model_name='portefolio',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='accounts.profile', verbose_name='Collaborateur'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='office',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='customers.office', verbose_name='Cabinet'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='Utilisateur'),
        ),
        migrations.AlterField(
            model_name='validator',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='accounts.profile', verbose_name='Collaborateur'),
        ),
    ]
