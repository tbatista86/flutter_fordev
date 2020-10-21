# Remote Authentication Use Case

## Caso de sucesso
1. OK - Sistama valida os dados
2. OK - Sistema faz requisição para URL da API de login
3. Sistama valida os dados recebido da API
4. Sistema entrega os dados da conta de usuário

> ## Exceção - URL inválida
1. Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Dados inválidos
1. OK - Sistema retorna uma menssagem de erro inesperado

> ## Exceção - Resposta inválida
1. Sistema retorna uma menssagem de erro inesperado

> ## Exceção - Falha no servido
1. Sistema retorna uma menssagem de erro inesperado

> ## Credencias inválidas
1. Sistema retorna uam menssagem de erro informando que as credenciais estão erradas