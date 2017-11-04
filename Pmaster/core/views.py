from django.shortcuts import render
from django.http import request
from django.http import HttpResponse

def index(request):
    return render(request,"index.html")

def Noticias(request):
    return render(request,"Noticias.html")

def Administracao_de_redes(request):
    return render(request,"Administracao_de_redes.html")

def Administracao(request):
    return render(request,"Administracao.html")

def Cadastrar_disciplina(request):
    return render(request,"Cadastrar_disciplina.html")

def Cadastrar_usuario(request):
    return render(request,"Cadastrar_usuario.html")

def Comunicacao_e_expressao(request):
    return render(request,"Comunicacao_e_expressao.html")

def Contato(request):
    return render(request,"Contato.html")

def Lista_de_curso(request):
    return render(request,"Lista_de_curso.html")

def Logica_programacao(request):
    return render(request,"Logica_programacao.html")

def Login(request):
    return render(request,"Login.html")

def Recuperar_senha(request):
    return render(request,"Recuperar_senha.html")

def Sistemas_informacao(request):
    return render(request,"Sistemas_informacao.html")

def Rede_computadores(request):
    return render(request,"Rede_computadores.html")

# Create your views here.
