import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/home_Page.dart';
import 'package:lottie/lottie.dart'; // Assurez-vous que Lottie est bien ajouté dans pubspec.yaml

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(); // Contrôle la navigation
  int currentPage = 0; // Page actuelle

  // Liste des pages d'onboarding avec animations Lottie et textes dynamiques
  final List<Map<String, dynamic>> onboardingPages = [
    {
      "title": "Bienvenue",
      "description": "Découvrez notre application et commencez à l'utiliser.",
      "backgroundColor":
          Color(0xFFDFE1EE), // Utilisez Color pour définir les couleurs
      "animation": "assets/lotties/animation1.json",
    },
    {
      "title": "Organisez vos tâches",
      "description": "Restez organisé et productif avec notre application.",
      "backgroundColor": Color(0xFFADE4FF),
      "animation": "assets/lotties/animation2.json",
    },
    {
      "title": "Atteignez vos objectifs",
      "description":
          "Suivez vos progrès et atteignez vos objectifs plus rapidement.",
      "backgroundColor": Color(0xFFEDF1F3),
      "animation": "assets/lotties/started.json",
    },
  ];

  // Méthode pour construire chaque page avec animation Lottie et texte dynamique
  static Widget _buildPage(String title, String description, String animation,
      Color backgroundColor) {
    return Container(
      color: backgroundColor, // Utilisez la couleur de fond passée en paramètre
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset(
              animation,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour rediriger après avoir terminé l'onboarding
  void _onGetStarted() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: "Accueil",
              )), // Remplacer par ta page d'accueil
    );
  }

  @override
  void initState() {
    super.initState();
    // Ajoute un listener pour observer les changements dans le PageView
    _pageController.addListener(() {
      int nextPage = _pageController.page?.round() ?? 0;
      if (nextPage != currentPage) {
        setState(() {
          currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Onboarding")),
      body: Stack(
        children: [
          // Le défilement des pages avec contenu interactif
          PageView(
            controller: _pageController,
            children: onboardingPages.map((page) {
              return _buildPage(
                page["title"]!,
                page["description"]!,
                page["animation"]!,
                page[
                    "backgroundColor"], // Passez la couleur de fond au constructeur
              );
            }).toList(),
          ),
          // Indicateur de progression et bouton
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Indicateur de progression
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingPages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 5),
                      height: 10,
                      width: currentPage == index
                          ? 20
                          : 10, // La taille de l'indicateur varie
                      decoration: BoxDecoration(
                        color: currentPage == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Bouton "Get Started" qui redirige
                if (currentPage == onboardingPages.length - 1)
                  ElevatedButton(
                    onPressed: _onGetStarted,
                    child: const Text("Get Started"),
                  ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Nettoyer le contrôleur
    super.dispose();
  }
}
