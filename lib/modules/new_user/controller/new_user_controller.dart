import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:patient_front_end/utils/widgets/snackbar/snack_bar.dart';

import '../../../repository/new_user/new_user_impl.dart';
part 'new_user_controller.g.dart';

class NewUserController = _NewUserController with _$NewUserController;

abstract class _NewUserController with Store {
  final _newUser = NewUserImpl();
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  Future newUser(String email, String senha) async {
    try {
      setIsLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      String userCreated = await _newUser.newUser(email, senha);

      if (userCreated == 'Usuário cadastrado com sucesso') {
        setIsLoading(false);
        SnackBarCustom.success(userCreated);
        Modular.to.navigate('/login');
      } else {
        setIsLoading(false);
        SnackBarCustom.error(userCreated);
      }
    } on Exception catch (e) {
      setIsLoading(false);
      SnackBarCustom.error(e.toString());
    }
  }
}
