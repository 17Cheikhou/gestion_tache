import 'dart:async';
import 'package:flutter/material.dart';

import 'package:gestion_tache/Pages/onboarding.dart';
import 'package:lottie/lottie.dart';

class MyLoadingPage extends StatefulWidget {
  const MyLoadingPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoadingPage> createState() => _MyLoadingPageState();
}

class _MyLoadingPageState extends State<MyLoadingPage> {
  @override
  void initState() {
    super.initState();
    chargeAnimation();
  }

  Future<Timer> chargeAnimation() async {
    return Timer(const Duration(seconds: 3), chargement);
  }

  chargement() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OnboardingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lotties/animation0.json", repeat: false),
      ),
    );
  }
}
