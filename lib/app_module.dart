import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/home/home_module.dart';
import 'package:patient_front_end/modules/login/controller/login_controller.dart';
import 'package:patient_front_end/modules/login/login_page.dart';
import 'package:patient_front_end/repository/new_user/new_user_module.dart';
import 'package:patient_front_end/repository/new_user/new_user_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => LoginController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const LoginView(),
        ),
        ModuleRoute('/page', module: HomeModule()),
        ModuleRoute('/user', module: NewUserModule()),
      ];
}
