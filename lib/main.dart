import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/app_module.dart';
import 'package:patient_front_end/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      debugMode: true,
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
