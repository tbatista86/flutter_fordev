# Survey Result presenter

> ## Regras
1. Chamar LoadSurveyResult no método loadData
2. Notificar o isLoadingStream como true antes de chamar o LoadSurveyResult
3. Notificar o isLoadingStream como false no fim do LoadSurveyResult
4. Notificar o surveyResultStream com errocado o LoadSurveyresult retorne erro
5. Notificar o surveyResultStream com um SurveyResult cado o LoadSurveyResult retorne sucesso