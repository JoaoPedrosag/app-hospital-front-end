import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login_service.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:patient_front_end/repository/login/login_service.dart';
import 'package:patient_front_end/utils/constants.dart';

class LoginServiceImpl extends ILoginService {
  final storage = FlutterSecureStorage();
  @override
  Future<bool> loginUsers(String email, String senha) async {
    try {
      final url = Uri.parse(ApiConst.BASE_URL + ApiConst.URL_LOGIN);
      final response = await http.post(url, body: {
        'email': email,
        'senha': senha,
      }).timeout(Duration(seconds: 3), onTimeout: () {
        print('timeout');
        throw Exception('timeout');
      });

      String responseBody = await jsonDecode(response.body)['mensagem'];
      if (responseBody == 'Sucesso') {
        String value = await jsonDecode(response.body)['token'];
        await storage.write(key: 'token', value: value);

        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      throw UnimplementedError(e.message);
    }
  }
}
