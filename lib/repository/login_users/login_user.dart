import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:patient_front_end/repository/contract/i_login_service.dart';
import 'package:patient_front_end/utils/constantes/api_const.dart';
import 'package:http/http.dart' as http;

class LoginUsers implements ILoginService {
  @override
  Future<bool> loginUsers(String email, String senha) async {
    try {
      final url = Uri.parse(ApiConst.BASE_URL + ApiConst.URL_LOGIN);
      final response = await http.post(url, body: {
        'email': email,
        'senha': senha,
      });
      String responseBody = jsonDecode(response.body)['mensagem'];
      if (responseBody == 'Sucesso') {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      throw UnimplementedError(e.message);
    }
  }
}
