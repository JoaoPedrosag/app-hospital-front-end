import 'package:flutter_test/flutter_test.dart';
import 'package:patient_front_end/repository/login/login_service_impl.dart';

void main() {
  test('Deve logar', () async {
    final login = LoginServiceImpl();
    login.loginUsers('email: admin', 'senha: admin');
  });
}
