import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/utils/shared_secure/shared_secure_impl.dart';

class HomePage extends StatelessWidget {
  final shared = SharedSecureImpl();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        title: const Text('Bem vindo(a), usuário de acesso'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('ss');
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.perm_contact_cal,
                              size: 60,
                              color: Colors.red,
                            ),
                            Text(
                              'Add pacientes',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('s2');
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.perm_contact_cal,
                              size: 60,
                              color: Colors.green,
                            ),
                            Text(
                              'Pacientes',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
