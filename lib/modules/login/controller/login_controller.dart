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

  @observable
  bool isVisible = true;

  @action
  void setIsVisible(bool value) {
    isVisible = value;
  }

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  Future login(String email, String password) async {
    try {
      setIsLoading(true);
      await Future.delayed(Duration(seconds: 2), () async {
        bool loginFeito = await _loginService.loginUsers(email, password);
        if (loginFeito) {
          setIsLoading(false);
          SnackBarCustom.success('Login realizado com sucesso');
          Modular.to.navigate('/home');
        } else {
          setIsLoading(false);
        }
      });
    } catch (e) {
      setIsLoading(false);

      SnackBarCustom.error('Login ou senha inválidos');
    }
  }
}
