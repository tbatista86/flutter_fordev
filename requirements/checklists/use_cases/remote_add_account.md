# Remorte AddAccount

> ## Caso de sucesso 
1. OK - Sitema valida os dados
2. OK - Sistema faz uma requisição para a URL da api signup
3. OK - Sistema valida os dados recebidos da API
4. OK - sistema entrega os dados da conta do usuário

> ## Exceção - URL inválida
1. OK - Sistema retorna uma mensagem de erro inesperado 

> ## Exceção - Dados inválidos
1. OK - SIstema retorna uma mensagem de erro inesperado

> ## Exceção - Resposta inválida
1. OK - Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Falha do Servidor
1. OK - Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Email em uso
1. OK - Sistema retorna uma mensagem de erro informando que o email já está em uso 