import './translations.dart';

class PtBr implements Translation {
  String get msgRequiredField => 'Campo obrigatório.';
  String get msgInvalidField => 'Campo inválido.';
  String get msgInvalidCredential => 'Credencias inválidas.';
  String get msgDefaultError =>
      'Algo errado aconteceu. Tente novamente em breve.';
  String get msgEmailInUse => 'O email já está em uso.';
  String get addAccount => 'Criar Conta';
  String get confirmPassword => 'Confirmar senha';
  String get email => 'Email';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get name => 'Nome';
  String get password => 'Senha';
  String get reload => 'Recarregar';
  String get surveys => 'Enquetes';
  String get wait => 'Aguarde ...';
}
