import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/patients/newPatients/controller/new_patients_controller.dart';
import 'package:patient_front_end/modules/patients/newPatients/new_patients_page.dart';
import 'package:patient_front_end/modules/patients/pages/my_patients_page.dart';
import 'package:patient_front_end/modules/patients/service/patients_impl.dart';

class NewPatientsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => NewPatientsController(),
        ),
        Bind.lazySingleton(
          (i) => PatientsImpl(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const NewPatient(),
        ),
        ChildRoute(
          '/mypatients',
          child: (context, args) => const MyPatientsPage(),
        ),
        // ChildRoute(
        //   '/electronic',
        //   child: (context, args) => ElectronicPatientsPage(),
        // ),
      ];
}
