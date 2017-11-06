from django import forms

class ContatoForm(forms.Form):
    nome = forms.CharField(label="Nome", required=True)
    email = forms.EmailField(label="E-mail", help_text="Informe um E-mail válido")
    mensagem = forms.CharField(label="Mensagem", widget=forms.Textarea(), required=True)

    def envia_email(self):
        print("Nome:",self.cleaned_data["nome"],
                "Email:",self.cleaned_data["email"],
                "Mensagem:",self.cleaned_data["mensagem"]
                                                        )
