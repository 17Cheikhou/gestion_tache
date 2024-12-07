import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/home_Page.dart';
import 'package:gestion_tache/Pages/inscription_page.dart';
import 'package:lottie/lottie.dart';

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
  Widget _buildPage(String title, String description, String animation,
      Color backgroundColor, int currentPage) {
    return Container(
      color: backgroundColor, // Utilisez la couleur de fond passée en paramètre
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Affichage de l'animation Lottie
          Expanded(
            child: Lottie.asset(
              animation,
              fit: BoxFit.cover,
            ),
          ),
          // Indicateur de progression entre l'animation et le titre
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3, // Le nombre total de pages
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 5),
                height: 10,
                width:  currentPage == index ? 20 : 10, // La taille de l'indicateur varie
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacement entre l'indicateur et le titre
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
  void _onNextPage() {
    if (currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const SignupPage(
                  title: "Inscription",
                )),
      );
    }
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
      appBar: AppBar(title: const Text("Gestion des Taches")),
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
                page["backgroundColor"],
                currentPage, // Passer currentPage à la méthode
              );
            }).toList(),
          ),
          // Indicateur de progression et icône de navigation
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Afficher l'icône uniquement sur la troisième page
                if (currentPage == onboardingPages.length - 1)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: _onNextPage,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue, 
                          shape: BoxShape.circle, 
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white, // Couleur de l'icône
                          size: 30,
                        ),
                      ),
                    ),
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
