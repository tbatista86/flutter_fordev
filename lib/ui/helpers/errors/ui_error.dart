enum UiError {
  requireField,
  invalidField,
  unexpected,
  invalidCredentials,
}

extension UiErrorExtension on UiError {
  String get description {
    switch (this) {
      case UiError.requireField:
        return 'Campo obrigatório.';
      case UiError.invalidField:
        return 'Campo inválido.';
      case UiError.invalidCredentials:
        return 'Credencias inválidas.';
      default:
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}
