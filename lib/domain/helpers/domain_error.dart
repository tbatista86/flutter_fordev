enum DomainError {
  unexpected,
  invalidCredentials,
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credencias inválidas.';
      default:
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}
