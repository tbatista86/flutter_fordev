# HTTP

> ## Sucesso
1. OK - Request com verbo http válido (post)
2. OK - Passar nos headers o content type JSON
3. OK - Chamar request com body correto
4. OK - OK - 200 e reposta com dados
5. OK - No content - 204  e resposta sem dados

> ## Erros 
1. OK - Bad Request - 400
2. OK - Unauthorized - 401
3. OK - Forbidden - 403
4. OK - Not Found - 404
5. OK -  Internal server error - 500

> ## Exceção - Status code diferente dos citados acima
1. OK - Internal server error - 500

> ## Execeção - Http request deu alguma exceção 
1. OK - Internal server error - 500

> ## Exceção - Verbo http inválido
1. OK - Internal server error - 500