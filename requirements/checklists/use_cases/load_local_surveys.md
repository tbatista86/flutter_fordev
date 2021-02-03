# Local Load Surveys

> ## Caso de sucesso
1. OK - Sistema solicita os dados das enquetes do cache
2. OK - Sistema entrega os dados das enquetes

> ## Exceção - Erro ao carregar dados do cache
1. OK - Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Cache vazio
1. OK - Sistema retorna uma mensagem de erro

--

# Local Validade Surveys

> ## Caso de sucesso
1. OK - Sistema solicita os dados das enquetes do Cache
2. OK - Sistema valida os dados recebidos do cache

## Exeção - Erro ao carregar dados do Cache
1. OK - Sistema limpa os dados do cache
> ## Exceção - Dados inválidos no cache
1. OK - Sistema limpa os dados do cache

--

# Local Save Surveys

> ## Caso de Sucesso 
1. OK -  Sistema grava os novos dados no Cache

> ## Eceção - Erro ao gravar dados no Cache
1. OK - Sistema retorna uma mensagem de erro inesperado