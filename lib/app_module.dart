import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/home/home_module.dart';
import 'package:patient_front_end/modules/login/controller/login_controller.dart';
import 'package:patient_front_end/modules/login/login_module.dart';
import 'package:patient_front_end/modules/new_user/controller/new_user_controller.dart';
import 'package:patient_front_end/modules/new_user/new_user_module.dart';
import 'package:patient_front_end/modules/patients/new_patients_module.dart';
import 'package:patient_front_end/modules/splash/splash_page.dart';
import 'package:patient_front_end/utils/shared_secure/shared_secure_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => LoginController(),
        ),
        Bind.lazySingleton(
          (i) => NewUserController(),
        ),
        Bind.lazySingleton(
          (i) => SharedSecureImpl(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ModuleRoute(
          '/user',
          module: NewUserModule(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ModuleRoute(
          '/newPatient',
          module: NewPatientsModule(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
