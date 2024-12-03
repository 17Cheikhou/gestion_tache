import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/profile_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to Scaffold
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
            // Use the GlobalKey to open the drawer
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Header with profile picture and name
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
                color: Color(0xFF0F91DA),
              ),
            ),
            // List of user details
            ListTile(
              leading: Icon(Icons.account_circle, color: Color(0xFF0F91DA)),
              title: Text('Profil', style: TextStyle(fontSize: 16)),
              onTap: () {
                // Naviguer vers la page de profil lorsque l'utilisateur clique sur "Déconnexion"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyProfilePage(
                            title: 'Mon Profile',
                          )), // Rediriger vers la page de profil
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF0F91DA)),
              title: Text('Paramètres', style: TextStyle(fontSize: 16)),
              onTap: () {
                // Handle settings navigation
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Déconnexion', style: TextStyle(fontSize: 16)),
              onTap: () {
                // aller  logout
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Bienvenue sur la page d'accueil!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Gestion des Tâches');
  }
}
