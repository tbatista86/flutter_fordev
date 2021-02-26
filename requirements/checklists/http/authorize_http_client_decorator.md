# Authorize HTTP Client Decorator

> ## Sucesso 
1. OK - Obter o token de acesso do Cache
2. OK - Executar o request do HttpClient que está sendo decorado com um novo header (x-access-token)
3. OK - Retornar a mesma resposta do HttpClient que está sendo decorado

> ## Exceção - Falha ao obter dados do cache
1. OK - Retornar erro HTTP Forbidde - 403
2. OK - Apagar token de acesso do cache

# ## Exceção - HttpClient retornou alguma exceção (menos Forbidden)
1. OK - Retornar a mesma exceção recebida
## Exceção - HttpCliente retornou alguma exeção 
1. OK - Retornan a mesma exeção recebida
2. Apagar token de acesso do cache