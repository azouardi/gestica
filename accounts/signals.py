from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from accounts.models import Profile


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **Kwargs):
       
    if created:
        Profile.objects.create(user=instance)
#post_save.connect(create_profile, sender=User)

@receiver(post_save, sender=User)

def update_profile(sender, instance, created, **kwaergs):
    
    if created == False:
        instance.profile.save()  
#post_save.connect(update_profile, sender=User)