import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patient_front_end/modules/login/controller/login_controller.dart';
import 'package:patient_front_end/repository/login/login_service_impl.dart';
import 'package:patient_front_end/utils/widgets/button/solumed_button.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 248, 1),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(
                  builder: (_) => Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          "assets/images/logo_.png",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          // validator: Validatorless.multiple([
                          //   Validatorless.required('Email não deve ser vazio'),
                          //   Validatorless.email('Email é invalido'),
                          // ]),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // validator: Validatorless.multiple([
                          //   Validatorless.required('Senha não pode ser vazia'),
                          //   Validatorless.min(
                          //       6, 'Senha não pode ter menos de 6 caracteres'),
                          //   Validatorless.max(
                          //       20, 'Senha não pode ter mais de 30 caracteres'),
                          // ]),
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: 'Senha',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.isLoading
                            ? const CircularProgressIndicator()
                            : SolumedButton(
                                width: MediaQuery.of(context).size.height * 0.7,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    controller.login(emailController.text,
                                        passwordController.text);
                                  }
                                },
                                label: const Text('Entrar'),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
