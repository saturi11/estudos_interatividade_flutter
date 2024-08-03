import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../my_app.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 191, 219, 254),
              Color.fromARGB(255, 243, 240, 255),
            ],
          )),
          child: Center(
              child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                repeatForever: false,
                isRepeatingAnimation: false,
                onFinished: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                animatedTexts: [
                  FadeAnimatedText('do IT!'),
                  FadeAnimatedText('do it RIGHT!!'),
                  FadeAnimatedText('do it RIGHT NOW!!!'),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
