import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patient_front_end/utils/widgets/button/solumed_button.dart';
import 'package:patient_front_end/utils/widgets/text_form_field/custom_text_form_field.dart';
import 'package:validatorless/validatorless.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({Key? key}) : super(key: key);

  @override
  State<NewPatient> createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final nameMother = TextEditingController();
  final dataDascimento = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    nameMother.dispose();
    dataDascimento.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Criar paciente'),
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
                labelText: 'Nome do paciente',
                prefixIcon: const Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.black87,
                ),
                validator:
                    Validatorless.required('Nome do paciente é obrigatório'),
                keyboardType: TextInputType.name,
                controller: name,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  validator:
                      Validatorless.required('Nome da mãe é obrigatório'),
                  keyboardType: TextInputType.name,
                  controller: nameMother,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                    color: Colors.black87,
                  ),
                  labelText: 'Nome da mãe'),
              const SizedBox(
                height: 20,
              ),

              CustomTextFormField(
                  validator: Validatorless.required('CPF'),
                  keyboardType: TextInputType.name,
                  controller: nameMother,
                  prefixIcon: const Icon(
                    Icons.contact_page_rounded,
                    size: 30,
                    color: Colors.black87,
                  ),
                  labelText: 'CPF'),
              const SizedBox(
                height: 20,
              ),
              // DatePickerDialog(
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(1900),
              //   lastDate: DateTime(2022),
              // ),
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
