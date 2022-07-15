import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        "assets/images/HeadMed.png",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.grey,
                          filled: true,
                          prefixIcon: Icon(Icons.email_outlined),
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
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.grey,
                          filled: true,
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'Senha',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
