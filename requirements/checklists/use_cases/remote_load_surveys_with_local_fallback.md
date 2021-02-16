# Remote Load Surveys With Local FallBack

> ## Caso de sucesso
1. OK - Sistema executa o load da implementação remota
2. OK - Sistema substitui os dados do cache com os dados obtidos
3. OK - Sistema retorna esses dado

> ## Exceção - Acesso negado
1. OK - Sistema repassa a execeção de acesso negado

> ## Exceção - QUalquer outro erro
1. OK - Sistema execuata o método de validar dados do cache
2. OK - Sistema execuata o método de carregar dados do cache
3. OK - Sistema retorna esses dados

> ## Execeção - Erro ao obter dados do cache
1. OK - Sistema retorna um execeção de erro inesperado