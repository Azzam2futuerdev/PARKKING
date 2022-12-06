import 'package:flutter/material.dart';
import 'package:lottie_animation/screens/signinorregister.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInOrRegister(),
    );
  }
}