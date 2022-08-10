import 'package:flutter/material.dart';
import 'package:patient_front_end/utils/widgets/button/solumed_button.dart';
import 'package:patient_front_end/utils/widgets/text_form_field/custom_text_form_field.dart';
import 'package:validatorless/validatorless.dart';

import '../../../utils/funcs/functions.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({Key? key}) : super(key: key);

  @override
  State<NewPatient> createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final nameMother = TextEditingController();
  final cpf = TextEditingController();
  DateTime dataDascimento = DateTime.now();

  @override
  void dispose() {
    name.dispose();
    nameMother.dispose();
    cpf.dispose();

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                    validator: Validatorless.multiple([
                      Validatorless.cpf('CPF inválido'),
                    ]),
                    keyboardType: TextInputType.name,
                    controller: cpf,
                    prefixIcon: const Icon(
                      Icons.contact_page_rounded,
                      size: 30,
                      color: Colors.black87,
                    ),
                    labelText: 'CPF'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 225, 227, 235),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.calendar_today,
                          size: 30,
                          color: Colors.black87,
                        ),
                        onPressed: () async {
                          final date = await pickDate();
                          if (date == null) return;
                          setState(() {
                            dataDascimento = date;
                            print(dataDascimento);
                          });
                        },
                      ),
                      Text(
                        '${dataDascimento.day}/${dataDascimento.month}/${dataDascimento.year}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dataDascimento,
        firstDate: DateTime(1900),
        lastDate: DateTime(2023),
      );
}