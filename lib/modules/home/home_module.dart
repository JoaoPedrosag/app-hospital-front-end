import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/home/home_page.dart';
import 'package:patient_front_end/modules/login/login_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/home',
          child: (context, args) => const HomePage(),
        ),
      ];
}
