import 'package:patient_front_end/repository/new_user/new_user.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:patient_front_end/repository/login/login_service.dart';
import 'package:patient_front_end/utils/constants.dart';

class NewUserImpl extends INewUserService {
  @override
  Future<bool> newUser(String email, String senha) async {
    return true;
  }
}
