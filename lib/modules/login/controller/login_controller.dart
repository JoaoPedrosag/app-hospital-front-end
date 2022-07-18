import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:patient_front_end/repository/login/login_service_impl.dart';
import 'package:patient_front_end/utils/widgets/snackbar/snack_bar.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final _loginService = LoginServiceImpl();

  @observable
  bool isLoading = false;

  @action
  Future login(String email, String password) async {
    isLoading = true;
    bool loginfeito = await _loginService.loginUsers(email, password);
    if (loginfeito) {
      isLoading = false;
      SnackBarCustom.success('Login realizado com sucesso');
      Modular.to.navigate('/page/home');
    } else {
      isLoading = false;
      SnackBarCustom.success('Login ou senha inválidos');
    }
  }
}
