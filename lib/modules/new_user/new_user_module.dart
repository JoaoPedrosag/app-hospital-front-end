import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/new_user/new_user_page.dart';

class NewUserModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const NewUserPage(),
        ),
      ];
}
