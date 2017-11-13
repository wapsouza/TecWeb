from django.db import models
from django.contrib.auth.models import AbstractBaseUser, UserManager

class Usuario(AbstractBaseUser):

    nome = models.CharField("Nome",max_length=100, blank=True)
    ativo = models.BooleanField("Ativo", default="True")
    senha = models.CharField("Senha")


# Create your models here.
