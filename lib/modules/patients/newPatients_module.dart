import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/patients/newPatients/newPatients_page.dart';

class NewPatientsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const NewPatient(),
        ),
      ];
}
