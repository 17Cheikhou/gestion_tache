import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/chargement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Tâches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoadingPage(
        title: 'Accueil',
      ), // Page d'onboarding au démarrage
    );
  }
}
