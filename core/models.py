from django.contrib.auth.models import AbstractUser as BaseAbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _

from .managers import UserManager


class AbstractUser(BaseAbstractUser):
    username = None
    email = models.EmailField(_("email address"), unique=True)
    
    #: First and last name do not cover name patterns around the globe
    name = models.CharField(_("Name of User"), blank=True, max_length=255)
    

    USERNAME_FIELD: str = 'email'
    REQUIRED_FIELDS = []

    
    objects = UserManager()

    class Meta(BaseAbstractUser.Meta):
        abstract = True
