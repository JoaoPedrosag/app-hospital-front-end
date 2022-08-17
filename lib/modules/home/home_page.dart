import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/utils/shared_secure/shared_secure_impl.dart';

import 'widgets/widgets_card.dart';

class HomePage extends StatelessWidget {
  final shared = SharedSecureImpl();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text(
          'Olá, Dr.João',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              shared.deleteAll();
              Modular.to.navigate('/login');
            },
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 360,
                              height: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuButton(
                      'Adicionar Pacientes',
                      Icons.person,
                      onTap: () {
                        Modular.to.pushNamed('/newPatient/');
                      },
                    ),
                    MenuButton(
                      'Meus Pacientes',
                      Icons.people,
                      onTap: () {
                        Modular.to.pushNamed('/newPatient/electronic');
                      },
                    ),
                    MenuButton(
                      'Meus Agendamentos',
                      Icons.schedule,
                    ),
                    MenuButton(
                      'Cadastrar médicos',
                      Icons.medical_services_rounded,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
