# Remote Load Surveys With Local FallBack

> ## Caso de sucesso
1. Sistema executa o load da implementação remota
2. Sistema substitui os dados do cache com os dados obtidos
3. Sistema retorna esses dado

> ## Exceção - Aceso negado
1. Sistema repassa a execeção de acesso negado

> ## Exceção - QUalquer outro erro
1. Sistema execuata o método de validar dados do cache
2. Sistema execuata o método de carregar dados do cache
3. Sistema retorna esses dados

> ## Execeção - Erro ao obter dados do cache
1. Sistema retorna um execeção de erro inesperado