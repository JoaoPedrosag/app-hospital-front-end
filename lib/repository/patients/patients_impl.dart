import 'package:patient_front_end/repository/patients/patients_service.dart';
import 'package:patient_front_end/utils/constants.dart';
import 'package:http/http.dart' as http;

class PatientsImpl extends IPatientsService {
  @override
  Future<String> newPatient(String name, String nameMother,
      DateTime dataDascimento, int idade) async {
    try {
      final url = Uri.parse(ApiConst.BASE_URL + ApiConst.URL_CREATE_PATIENT);
      final response = await http.post(url, body: {
        {
          "nome": name,
          "nome_da_mae": nameMother,
          "data_nascimento": dataDascimento,
          "endereco": "moises casa forquilinha",
          "idade": idade
        }
      });
      if (response.statusCode == 201) {
        return 'Usuário cadastrado com sucesso';
      } else if (response.statusCode == 409) {
        return 'Usuário já existe';
      } else {
        return 'Erro ao cadastrar usuário, por favor tente novamente';
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
