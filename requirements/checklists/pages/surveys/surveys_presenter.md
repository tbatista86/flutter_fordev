# Surveys Presenter

> ## Regras
1. OK - Chamar LoadSurveys no método loadData
2. Notificar o isLoadingStream como true antes de chamar o LoadSurveys
3. Notificar o isLoadingStream como false no fim do loadSurveys
4. Notificar o loadSurveysStream com erro cado o LoadSurvey retorne erro
5. Notificar o loadSurveysStream com uma lista de Surveys caso o LoadSurveys retorne sucesso
6. Levar o usuário para a tela de Resultado da Enquete ao clicar em alguma enquete