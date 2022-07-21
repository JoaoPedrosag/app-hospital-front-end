import 'package:flutter/material.dart';
import 'package:patient_front_end/utils/widgets/button/solumed_button.dart';
import 'package:patient_front_end/utils/widgets/text_form_field/custom_text_form_field.dart';
import 'package:validatorless/validatorless.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
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
          child: Column(
            children: [
              CustomTextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required('Email não deve ser vazio'),
                    Validatorless.email('Email é invalido'),
                  ]),
                  keyboardType: TextInputType.name,
                  controller: emailController,
                  labelText: 'Email'),
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
                  controller: emailController,
                  labelText: 'Senha'),
              const SizedBox(
                height: 20,
              ),
              SolumedButton(
                  width: MediaQuery.of(context).size.height * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  label: const Text('Cadastrar'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  })
            ],
          ),
        ),
      ),
    );
  }
}
