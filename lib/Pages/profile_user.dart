import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/home_Page.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key, required this.title});

  final String title;

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  // Contrôleurs pour les champs du formulaire
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  // GlobalKey pour gérer le Drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _prenomController.dispose();
    _nomController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    super.dispose();
  }

  // Méthode pour afficher une alerte lors de la déconnexion
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Déconnexion"),
          content: Text("Voulez-vous vraiment vous déconnecter ?"),
          actions: [
            TextButton(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Se déconnecter"),
              onPressed: () {
                Navigator.of(context).pop();
                // Ajouter la logique pour déconnexion ici
              },
            ),
          ],
        );
      },
    );
  }

  // Méthode pour modifier les informations personnelles
  void _editProfile() {
    // Logique pour modifier le profil (par exemple ouvrir une nouvelle page ou un modal)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Profil modifié avec succès !"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assignation du GlobalKey
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Color(0xFF0F91DA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 28),
          onPressed: () {
            // Utiliser le GlobalKey pour ouvrir le drawer
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: Text("johndoe@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Color(0xFF0F91DA)),
              title: Text('Accueil', style: TextStyle(fontSize: 16)),
              onTap: () {
                // Naviguer vers la page de profil lorsque l'utilisateur clique sur "Déconnexion"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: 'Accueil',
                          )), // Rediriger vers la page de profil
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF0F91DA)),
              title: Text('Paramètres', style: TextStyle(fontSize: 16)),
              onTap: () {
                // Navigation vers paramètres
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Déconnexion', style: TextStyle(fontSize: 16)),
              onTap: _showLogoutDialog,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Prénom",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _prenomController,
              decoration: InputDecoration(
                hintText: "Entrez votre prénom",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text("Nom",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                hintText: "Entrez votre nom",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text("Email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Entrez votre email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text("Téléphone",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _telephoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Entrez votre numéro de téléphone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showLogoutDialog,
                  child: Text("Déconnexion"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  onPressed: _editProfile,
                  child: Text("Modifier mes infos"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyProfilePage(title: 'Gestion des Tâches');
  }
}
