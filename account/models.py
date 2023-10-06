from django.db import models
from django.utils.translation import gettext_lazy as _



from core.models import AbstractUser


class User(AbstractUser):
    """
    Users within the Django authentication system are represented by this
    model.

    Email and password are required. Other fields are optional.
    """

    class Meta(AbstractUser.Meta):
        swappable = "AUTH_USER_MODEL"
