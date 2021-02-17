Feature: Resultado de uma Enquete
Como um cliente
Quero poder ver o resultado de uma EnquetePara saber a opinião da cominidade a repoeito de casa tópico

Cénario: Com internet
Dado que o cliente tema conexão com a internet
Quando solicitar para ver o resultado da uma enquete 
Então o sistema deve exibir o resultado da enquete
E armazenar os dados atualizados no cache

Cénario: Sem internet
Dado que o cliente não tem conexão com a internet 
Quando solicitar para ver o resultado de uma enquete
Então o sistema deve exibir o resultado da enquete gravado no cache no pultimo acesso