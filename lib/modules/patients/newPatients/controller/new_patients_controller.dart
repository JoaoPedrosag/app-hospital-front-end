import 'package:mobx/mobx.dart';
part 'new_patients_controller.g.dart';

class NewPatientsController = _NewPatientsController
    with _$NewPatientsController;

abstract class _NewPatientsController with Store {
  @observable
  bool isLoading = false;

  Future<String> insertPatients() async {
    return 'Usuário cadastrado com sucesso';
  }
}
