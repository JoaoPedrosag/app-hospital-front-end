import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:patient_front_end/modules/patients/service/patients_impl.dart';
import 'package:patient_front_end/utils/funcs/functions.dart';
import 'package:patient_front_end/utils/widgets/snackbar/snack_bar.dart';
part 'new_patients_controller.g.dart';

class NewPatientsController = _NewPatientsController
    with _$NewPatientsController;

abstract class _NewPatientsController with Store {
  final repositoryPatients = Modular.get<PatientsImpl>();

  int age = 0;
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @observable
  DateTime age2 = DateTime.now();

  @observable
  bool isLoading = false;

  Future<String> insertPatients(String name, String nameMother, DateTime date,
      String endereco, int idade) async {
    try {
      setIsLoading(true);
      age = AppFunctions.getDate(date);

      print(age);
      final String created = await repositoryPatients.newPatient(
          name, nameMother, formatter.format(date), endereco, age);
      if (created == 'Paciente cadastrado com sucesso') {
        setIsLoading(false);
        SnackBarCustom.alert('Paciente cadastrado com sucesso');
      }
      return 'Paciente cadastrado com sucesso';
    } on Exception catch (e) {
      log(e.toString());
      return 'Erro ao cadastrar usuário';
    }
  }

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @computed
  void setAge(DateTime value) {
    age2 = value;
  }
}
