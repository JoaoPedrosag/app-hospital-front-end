import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/home/home_page.dart';
import 'package:patient_front_end/modules/login/controller/login_controller.dart';
import 'package:patient_front_end/modules/login/login_page.dart';
import 'package:patient_front_end/modules/new_user/controller/new_user_controller.dart';
import 'package:patient_front_end/modules/new_user/new_user_page.dart';
import 'package:patient_front_end/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => LoginController(),
        ),
        Bind.lazySingleton(
          (i) => NewUserController(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SplashPage(),
        ),
        ChildRoute(
          '/login',
          child: (context, args) => const LoginPage(),
        ),
        ChildRoute(
          '/home',
          child: (context, args) => HomePage(),
        ),
        ChildRoute(
          '/user',
          child: (context, args) => const NewUser(),
        ),
      ];
}
