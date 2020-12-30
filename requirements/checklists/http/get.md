# HTTP Get

> ## Sucesso
1. OK -Request com verbo http correto (get)
2. OK - Passar nos headers o content type JSON
3. OK - 200 e resposta com dados
4. OK - No content - 204 e resposta sem dados

> ## Erros
1. OK - Bad Request - 400
2. OK - Unaumthorized - 401
3. OK - Forbidden - 403
4. OK - Not Found - 404
5. OK - Internal Server Error - 500

> ## Exceção - Status code diferentes dos citados acima
1. OK - Internal Server Error - 500

> ## Exceção - Http request deu alguma exceção
1. OK - Internal Server Error - 500

> ## Exceção - Verbo http inválido
1. OK - Internal Server Error - 500