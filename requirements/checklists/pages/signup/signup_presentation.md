## Signup Presenter

> ## Regras
1. OK - Chamar validation no alterar email
2. OK - Notificar o emailErroStream com o mesmo erro do validation, caso retorne erro
3. OK - Notificar o emailErroStream com null, caso o validation não retorne erro
4. OK - Não notificar o emailErrorStream se o valor for igual ao útimo
5. OK - Notificar o isFormValidStream após alterar o email
6. Chamar o validation ao alterar a senha
7. Notificar o passwroErrorStream com o mesmo erro do validation, caso retorne erro
8. Notificar o passwordErrorStream com null, caso o validation não retorne erro
9. Não notificar o passwordErrorStream se o valor for igual ao do último
10. Notificar o isFormValidStream após alterar a senha
11. Chamar o validation no alterar nome
12. Notificar o nameErrorStream com o mesmo erro do validation, caso retorne erro
13. Notificar o nameErrorStema com null, caso o validation não retorne erro
14. Não notificar o nameErrorStream se o valor for igual ao último
15. Notificar o isFormValidStream após alterar o nome
16. Chamar o validation no alterar confirmar senha
17. Notificar o passwordConfirmStream com o mesmo erro do validation, caso retorne erro
18. Notificar o passwordConfirmStream com null, caso o validation não retorne erro
19. Não notificar o passwordConfirmStema seo o valor for igual ao último
20. Notificar o isFormValidStream após alterar o confirmar senha
21. Para o formulário estar válido todos os Streams de serro precisam estar null e todos os campos obrigatórios não