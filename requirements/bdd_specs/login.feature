Feature: Login
Como um cliente
Quero poder acessar minha conta e me mander logado
Para que eu possa ver e responder enquetes de forma rápida

Cenário: Credenciais válidas
Dado que o cliente informou credenciais válidas
Quando solicitar para fazer Login
Então o sistema deve enviar o usuário para a tela de pesquisas
E manter o usuário conectado

Cenário? Credenciais inválidas
Dado que o cliente informou credenciais invcálidas
Quando solicitar para fazer Login
Então o sistema deve retornar uma menssagem de errro