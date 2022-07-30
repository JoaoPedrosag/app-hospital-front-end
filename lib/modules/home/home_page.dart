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
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: Card(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.perm_contact_cal,
                          size: 80,
                        ),
                        Text('Cadastrar pacientes')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
