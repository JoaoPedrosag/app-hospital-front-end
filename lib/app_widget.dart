import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/login/controller/login_controller.dart';
import 'package:patient_front_end/ui/colors/app_config_ui.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(
          create: (_) => LoginController(),
        ),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: asuka.builder,
          title: 'Solumed Solutions',
          theme: AppConfigUI.theme,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate),
    );
  }
}
