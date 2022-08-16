import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_front_end/modules/new_user/controller/new_user_controller.dart';
import 'package:patient_front_end/utils/widgets/button/solumed_button.dart';
import 'package:patient_front_end/utils/widgets/text_form_field/custom_text_form_field.dart';
import 'package:validatorless/validatorless.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Modular.get<NewUserController>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Criar usuário de acesso'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ))),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Observer(
            builder: (_) => Column(
              children: [
                CustomTextFormField(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.black87,
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Email não deve ser vazio'),
                    Validatorless.email('Email é invalido'),
                  ]),
                  keyboardType: TextInputType.name,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha não deve ser vazio'),
                      Validatorless.min(
                          6, 'Senha deve ter no mínimo 6 caracteres'),
                    ]),
                    keyboardType: TextInputType.name,
                    controller: passwordController,
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 30,
                      color: Colors.black87,
                    ),
                    labelText: 'Senha'),
                const SizedBox(
                  height: 20,
                ),
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : SolumedButton(
                        width: MediaQuery.of(context).size.height * 0.7,
                        height: MediaQuery.of(context).size.height * 0.07,
                        label: const Text('Cadastrar'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.newUser(
                                emailController.text, passwordController.text);
                          }
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
