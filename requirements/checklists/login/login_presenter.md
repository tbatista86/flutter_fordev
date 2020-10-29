# Login Presenter

> ## Regras
1. OK - Chamar validation ao alterar o email
2. OK - Notificar o emailErrorStream com o mesmo erro do Validation, caso retorne erro
3. Notificar o emailErrorStream com null, caso o Validation não retorne erro
4. OK - Não notificar o emailErrorStream se o valor for igual ao último
5. Notificar o isFormValidation após alterar o email
6. Chamar o validation ao alterar a senha
7. Notificar o passwordErrorStream com o mesmo erro do validation, caso retorne erro
8. Notificar o passwordErrorStream com null, caso o validation não retorne erro
9. Não notificar o passwordErroStream se o valor for igual ao último
10. Notificar o isFormvalidation após alterar a senha
11. Para o formulário esta válido todos os Streams de erro precisam estar null e todos os campos obrigátorios não podem estar vazio
12. Não notificar o isFormValidStream se o valor for igual ao último
13. Chamar o Authentication com email e senha corretos
14. Notificar o isLoadingStream como true antes de chamar o Authentication
15. Notificar o isLoadingStream como false no fim do Authentication 
16. Notificar o mainErrorStream caso o Authentication retorne um DomaiError
17. Fechar todos os Streams no dispose
18. Gravar o Account no cache em caso de sucesso
19. Levar ousuário para a tela de Enquetes em caso de sucesso