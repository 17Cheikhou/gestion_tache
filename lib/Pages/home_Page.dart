import 'package:flutter/material.dart';
import 'package:gestion_tache/Pages/profile_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 1; // Onglet par défaut (Home)

  // Liste des pages à afficher NB: c'est juste temporaire apres on va les changer
  final List<Widget> _pages = [
    Center(child: Text('Page Tâches', style: TextStyle(fontSize: 20))),
    Center(child: Text('Bienvenue sur la page d\'accueil!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
    MyProfilePage(title: 'Mon Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, 
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
                color: Color(0xFF0F91DA),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Color(0xFF0F91DA)),
              title: Text('Profil', style: TextStyle(fontSize: 16)),
              onTap: () {
                // Naviguer vers la page de profil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyProfilePage(
                            title: 'Mon Profile',
                          )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF0F91DA)),
              title: Text('Paramètres', style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Déconnexion', style: TextStyle(fontSize: 16)),
              onTap: () {
                // aller logout
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Affiche la page correspondante
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Indique l'onglet actif
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change l'index actif
          });
        },
        backgroundColor: Color(0xFFE6F7FF), 
        selectedItemColor: Colors.blue, 
        unselectedItemColor: Colors.black, 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment), // pour les taches
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            label: '',
          ),
        ],
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
