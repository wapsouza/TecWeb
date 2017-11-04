

"""Pmaster URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from core.views import *

urlpatterns = [
    url(r'^$',index),
    url(r'^Index',index),
    url(r'^Noticias',Noticias),
    url(r'^Administracao_de_redes',Administracao_de_redes),
    url(r'^Administracao',Administracao),
    url(r'^Cadastrar_disciplina',Cadastrar_disciplina),
    url(r'^Cadastrar_usuario',Cadastrar_usuario),
    url(r'^Comunicacao_e_expressao',Comunicacao_e_expressao),
    url(r'^Contato',Contato),
    url(r'^Lista_de_curso',Lista_de_curso),
    url(r'^Logica_programacao',Logica_programacao),
    url(r'^Login',Login),
    url(r'^Recuperar_senha',Recuperar_senha),
    url(r'^Sistemas_informacao',Sistemas_informacao),
    url(r'^Rede_computadores',Rede_computadores),
    url(r'^admin/', admin.site.urls),
]
