import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/profile_user.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // Widget enfant pour chaque écran
  final String title; // Titre de l'AppBar

  const MainLayout({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey, // Clé pour le Drawer
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Color(0xFF0F91DA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 28),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Ouvre le Drawer
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Header
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
            // List items
            ListTile(
              leading: Icon(Icons.account_circle, color: Color(0xFF0F91DA)),
              title: Text('Profil', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyProfilePage(title: 'Mon Profil')), // Page de profil
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
              onTap: () {
                // Navigation ou action de déconnexion
              },
            ),
          ],
        ),
      ),
      body: child, // Contenu de chaque écran
    );
  }
}
