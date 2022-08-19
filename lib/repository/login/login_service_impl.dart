import 'package:patient_front_end/utils/shared_secure/shared_secure_impl.dart';
import 'package:patient_front_end/utils/widgets/snackbar/snack_bar.dart';

import 'login_service.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:patient_front_end/repository/login/login_service.dart';
import 'package:patient_front_end/utils/constants.dart';

class LoginServiceImpl extends ILoginService {
  final shared = SharedSecureImpl();
  @override
  Future<String> loginUsers(String email, String senha) async {
    try {
      final url = Uri.parse(ApiConst.baseUrl + ApiConst.urlLogin);
      final response = await http.post(url, body: {
        'email': email,
        'senha': senha,
      }).timeout(const Duration(seconds: 3), onTimeout: () {
        SnackBarCustom.alert('Parece que você esta sem internet');
        throw Exception('timeout');
      });

      String responseBody = await jsonDecode(response.body)['mensagem'];
      if (responseBody == 'Sucesso') {
        String value = await jsonDecode(response.body)['token'];
        await shared.write('token', value);

        return 'Login realizado com sucesso';
      } else {
        return 'Senha ou usuario inválidos';
      }
    } on PlatformException catch (e) {
      throw UnimplementedError(e.message);
    }
  }
}
