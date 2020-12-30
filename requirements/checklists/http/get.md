# HTTP Get

> ## Sucesso
1. Request com verbo http correto (get)
2. Passar nos headers o content type JSON
3. OK - 200 e resposta com dados
4. No content - 204 e resposta sem dados

> ## Erros
1. Bad Request - 400
2. Unaumthorized - 401
3. Forbidden - 403
4. Not Found - 404
5. Internal Server Error - 500

> ## Exceção - Status code diferentes dos citados acima
1. Internal Server Error - 500

> ## Exceção - Http request deu alguma exceção
1. Internal Server Error - 500

> ## Exceção - Verbo http inválido
1. Internal Server Error - 500