import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: Center(
              child: Lottie.asset(
                'assets/splash.json',
                width: 200,
                height: 200,
              ),
            ),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Promed',
                  textStyle: TextStyle(fontSize: 25, color: Colors.black)),
            ],
          )
        ],
      ),
    );
  }
}
