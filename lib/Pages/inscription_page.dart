import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/connexion_page.dart';

class SignupPage extends StatelessWidget {
  final String title;

  const SignupPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Titre
                  Text(
                    "Créez un compte",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Champs de formulaire
                  _buildInputField("Prénom", Icons.person),
                  const SizedBox(height: 15),
                  _buildInputField("Nom", Icons.person),
                  const SizedBox(height: 15),
                  _buildInputField("Email", Icons.email),
                  const SizedBox(height: 15),
                  _buildInputField("Mot de passe", Icons.lock, isPassword: true),
                  const SizedBox(height: 15),
                  _buildInputField(
                    "Confirmer le mot de passe",
                    Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),

                  // Bouton S'inscrire
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            title: 'Login',
                          )), 
                );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0F91DA),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Texte ou continuer avec
                  Text(
                    "Ou continuer avec",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Boutons Google et Facebook
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.g_mobiledata, Colors.red),
                      const SizedBox(width: 20),
                      _buildSocialButton(Icons.facebook, Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Texte Vous avez un compte
                  GestureDetector(
                    onTap: () {
                      // Action pour "Vous avez un compte"
                    },
                    child: Text(
                      "Vous avez déjà un compte ?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0F91DA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget pour un champ de saisie
  Widget _buildInputField(String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Color(0xFF0F91DA)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF0F91DA), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  // Widget pour un bouton social
  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: color,
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
