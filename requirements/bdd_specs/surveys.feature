Feature: Listar Enquetes
Como um clientes
Quero poder ver todas as Enquetes
Para poder saber o resultado e poder dar minha opnião

Cenário: Com internet
Dado que o cliente tem conexão com a internet
Quando solicitar para ver a enquetes
Então o sistema deve exibir as enquetesE armazenar os dados atualizados em cahce

Cenário: Sem internet
Dado que o cliente não tem conexão com a internet
Quando solicitar para ver as enquetes
Então o sistema deve exibir as enquetes que foram gravadas no cahce no último acesso