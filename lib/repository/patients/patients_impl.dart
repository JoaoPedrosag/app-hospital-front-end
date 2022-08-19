import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/repository/patients/patients_service.dart';
import 'package:patient_front_end/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:patient_front_end/utils/shared_secure/shared_secure_impl.dart';
import 'package:patient_front_end/utils/widgets/snackbar/snack_bar.dart';

class PatientsImpl extends IPatientsService {
  final controller = Modular.get<SharedSecureImpl>();
  @override
  Future<String> newPatient(String name, String nameMother,
      String dataDascimento, String endereco, int idade) async {
    final String? token = await controller.read('token');
    try {
      final url = Uri.parse(ApiConst.baseUrl + ApiConst.urlCreatePatient);
      final response = await http.post(url, body: {
        "nome": name,
        "nome_da_mae": nameMother,
        "data_nascimento": dataDascimento,
        "endereco": endereco,
        "idade": idade.toString(),
      }, headers: {
        "Authorization": "Bearer ${token!}"
      }).timeout(const Duration(seconds: 3), onTimeout: () {
        SnackBarCustom.alert('Parece que você esta sem internet');
        throw Exception('timeout');
      });

      if (response.statusCode == 201) {
        return 'Paciente cadastrado com sucesso';
      } else if (response.statusCode == 409) {
        return 'Token invalido';
      } else {
        return 'Erro ao cadastrar usuário, por favor tente novamente';
      }
    } catch (e) {
      return 'Erro ao cadastrar usuário, por favor tente novamente';
    }
  }
}
