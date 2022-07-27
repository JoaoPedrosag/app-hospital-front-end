import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:patient_front_end/utils/shared_secure/shared_secure_impl.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final shared = SharedSecureImpl();
  @override
  void initState() {
    shared.read('token').then((value) {
      if (value != null) {
        Future.delayed(const Duration(seconds: 2), () {
          Modular.to.navigate('/home');
        });
      } else {
        Future.delayed(const Duration(seconds: 5), () {
          Modular.to.navigate('/login');
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Center(
              child: Lottie.asset(
                'assets/splash.json',
                width: 400,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
