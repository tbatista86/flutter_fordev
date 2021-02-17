# Remote load Surveys Result

> ## Caso de sucesso
1. OK - Sistema faz uma requisição para a URL da API de survey result
2. OK - Sistema valida o token de acesso para saber se o usuário tem permissão para vcer esses dados
3. OK - Sistema valida os dado recebidos da API
4. OK - Sistema entrega os dados do resultado da enquete

> ## Exceção - URL inválida
1. OK - Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Acesso negado
1. OK - Sistema retorna uma mensagem de acesso negado

> ## Exceção - Resposta inválida
1. OK - Sistema retorna uma mensagem de erro inespera

> ## Exceção - Falha do servidor
1. OK - Sistema retorna uma mensagem de erro inespera