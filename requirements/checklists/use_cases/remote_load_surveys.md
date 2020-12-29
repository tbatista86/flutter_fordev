# Remote Load Surveys

> ## Caso de Sucesso 
1. OK - Sistema faz requisição para a URL de API de surveys
2. Sistema valida o token de acesso para saber se o usuário tem permissão para ver esses dados
3. OK - Sistema valida os dados recebidos da API
4. OK - Sistema entrega os dados da enquetes

> ## Exceção - URL inválida
1. OK - Sistema retorna uma mensagem de erro inesperado

> ## Exceção Acesso negado
1. Sistema retorna uma mensagem de acesso negado

> ## Exceção  - Resposta inválida
1. OK - Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Falha no servidor
1. OK - Sistema retorna uma mensagem de erro inesperado