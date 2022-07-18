import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/login/controller/login_controller.dart';
import 'package:patient_front_end/utils/widgets/button/solumed_button.dart';
import 'package:patient_front_end/utils/widgets/text_form_field/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Modular.get<LoginController>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo_.png",
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        CustomTextFormField(
                          // validator: Validatorless.multiple([
                          //   Validatorless.required('Email não deve ser vazio'),
                          //   Validatorless.email('Email é invalido'),
                          // ]),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,

                          labelText: "Email",
                          prefixIcon: const Icon(
                            Icons.email,
                            size: 30,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Senha',

                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 30,
                            color: Colors.black87,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          obscureText: true,
                          // obscureText: controller.isVisible ? false : true,

                          // validator: Validatorless.multiple([
                          //   Validatorless.required('Senha não pode ser vazia'),
                          //   Validatorless.min(
                          //       6, 'Senha não pode ter menos de 6 caracteres'),
                          //   Validatorless.max(
                          //       20, 'Senha não pode ter mais de 30 caracteres'),
                          // ]),
                        ),
                        const SizedBox(
                          height: 40,
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
                        const SizedBox(
                          height: 120,
                        ),
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed('/user');
                          },
                          child: const Text(
                            'Cadastrar-se',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha ?',
                              style: TextStyle(color: Colors.black),
                            )),
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
