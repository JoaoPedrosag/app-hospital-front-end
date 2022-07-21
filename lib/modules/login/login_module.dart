import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/login/login_page.dart';
import 'package:patient_front_end/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const LoginPage(),
        ),
      ];
}
