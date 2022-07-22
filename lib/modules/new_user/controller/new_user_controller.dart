import 'package:mobx/mobx.dart';
part 'new_user_controller.g.dart';

class NewUserController = _NewUserController with _$NewUserController;

abstract class _NewUserController with Store {
  @observable
  bool isLoading = false;
}
