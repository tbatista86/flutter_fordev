## Signup Presenter

> ## Regras
1. OK - Chamar validation no alterar email
2. OK - Notificar o emailErroStream com o mesmo erro do validation, caso retorne erro
3. OK - Notificar o emailErroStream com null, caso o validation não retorne erro
4. OK - Não notificar o emailErrorStream se o valor for igual ao útimo
5. OK - Notificar o isFormValidStream após alterar o email
6. OK - Chamar o validation ao alterar a senha
7. OK - Notificar o passwroErrorStream com o mesmo erro do validation, caso retorne erro
8. OK - Notificar o passwordErrorStream com null, caso o validation não retorne erro
9. OK - Não notificar o passwordErrorStream se o valor for igual ao do último
10. OK - Notificar o isFormValidStream após alterar a senha
11. OK - Chamar o validation no alterar nome
12. OK - Notificar o nameErrorStream com o mesmo erro do validation, caso retorne erro
13. OK - Notificar o nameErrorStema com null, caso o validation não retorne erro
14. OK - Não notificar o nameErrorStream se o valor for igual ao último
15. OK - Notificar o isFormValidStream após alterar o nome
16. OK - Chamar o validation no alterar confirmar senha
17. OK - Notificar o passwordConfirmStream com o mesmo erro do validation, caso retorne erro
18. OK - Notificar o passwordConfirmStream com null, caso o validation não retorne erro
19. OK - Não notificar o passwordConfirmStema seo o valor for igual ao último
20. OK - Notificar o isFormValidStream após alterar o confirmar senha
21. OK - Para o formulário estar válido todos os Streams de serro precisam estar null e todos os campos obrigatórios não podem esta vazios
22. OK - Não notificar o isFormValidStream se o calor for igual ao último
23. Chamar o AddAcount com os valores corretos
24. Notificar o isLoadingStream como true antes de chamar o AddAccount
25. Notificar o isLoadingStream como false no fim do AddAccount
26. Notificar o mainErrorStream caso o AddAccount retorne erro
27. Fechar todos os Streams no dispose
28. Gravar o account no cache em caso de sucesso 
29. Notificar o mainErrorStream caso o SaveCurrentAccount retorne erro
30. Levar o usuário para a tela de enquetes em caso de sucesso
31. Levar o usuáro para tela de login ao clicar no link voltar para login