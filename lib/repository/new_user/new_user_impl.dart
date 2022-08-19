import 'package:patient_front_end/repository/new_user/new_user_service.dart';
import 'package:http/http.dart' as http;
import 'package:patient_front_end/utils/constants.dart';

class NewUserImpl extends INewUserService {
  @override
  Future<String> newUser(String email, String senha) async {
    try {
      final url = Uri.parse(ApiConst.baseUrl + ApiConst.urlCreateUsers);
      final response = await http.post(url, body: {
        'email': email,
        'senha': senha,
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
