import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient_front_end/utils/routers/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const Routes());
}
