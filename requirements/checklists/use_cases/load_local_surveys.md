# Local Load Surveys

> ## Caso de sucesso
1. OK - Sistema solicita os dados das enquetes do cache
2. Sistema entrega os dados das enquetes

> ## Exceção - Cache vazio
1. Sistema retorna uma mensagem de erro

--

# Local Validade Surveys

> ## Caso de sucesso
1. Sistema valida os dados recebidos do cache

> ## Exceção - Dados inválidos no cache
1. Sistema limpa os dados do cache

--

# Local Save Surveys

> ## Caso de Sucesso 
1. Sistema valida os dados das enquetes
2. Sistema apaga os dados do Cache antigo
3. Sistema grava os novos dados no Cache

> ## Exceção - Erro ao apagar os dados do Cache
1. Sistema retorna uma mensagem de erro 

> ## Eceção - Erro ao gravar dados no Cache
1. Sistema retorna uma mensagem de erro 