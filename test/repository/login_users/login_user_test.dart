import 'package:flutter_test/flutter_test.dart';
import 'package:patient_front_end/modules/login/login_models.dart';

void main() {
  test('Deve logar', () async {
    final login = LoginUsers();
    login.loginUsers('email: admin', 'senha: admin');
  });
}
