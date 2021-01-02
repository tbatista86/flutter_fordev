# Surveys Presenter

> ## Regras
1. OK - Chamar LoadSurveys no método loadData
2. OK - Notificar o isLoadingStream como true antes de chamar o LoadSurveys
3. OK - Notificar o isLoadingStream como false no fim do loadSurveys
4. Notificar o surveysStream com erro cado o LoadSurvey retorne erro
5. OK - Notificar o surveysStream com uma lista de Surveys caso o LoadSurveys retorne sucesso
6. Levar o usuário para a tela de Resultado da Enquete ao clicar em alguma enquete