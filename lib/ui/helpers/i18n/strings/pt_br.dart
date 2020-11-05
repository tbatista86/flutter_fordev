import './translations.dart';

class PtBr implements Translation {
  String get msgRequiredField => 'Campo obrigatório.';
  String get msgInvalidField => 'Campo inválido.';
  String get msgInvalidCredential => 'Credencias inválidas.';
  String get msgDefaultError =>
      'Algo errado aconteceu. Tente novamente em breve.';
  String get addAccount => 'Criar Conta';
  String get email => 'Email';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get password => 'Senha';
}
