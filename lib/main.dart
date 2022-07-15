import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:patient_front_end/utils/routers/routes.dart';

void main() {
  runApp(ModularApp(
    debugMode: true,
    module: AppModule(),
    child: AppWidget(),
  ));
}
