import 'package:patient_front_end/repository/new_user/new_user.dart';
import 'package:http/http.dart' as http;
import 'package:patient_front_end/utils/constants.dart';

class NewUserImpl extends INewUserService {
  @override
  Future<bool> newUser(String email, String senha) async {
    try {
      final url = Uri.parse(ApiConst.BASE_URL + ApiConst.URL_CREATE_USERS);
      final response = await http.post(url, body: {
        'email': email,
        'senha': senha,
      });
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 409) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
