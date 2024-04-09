import 'package:flutter/material.dart';
import 'package:street_food/homePage.dart';
import 'package:street_food/logInPage.dart';
import 'package:street_food/mapPage.dart';
import 'package:street_food/signUpPage.dart';


class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const HomePage(),
      drawer: Drawer(
        child: _buildDrawerContent(),
      ),
    );
  }

  Widget _buildDrawerContent() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/paw.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Kalani'),
                accountEmail: Text('kalani@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/p.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              MenuList(press: () {}, title: 'Home', icon: Icons.home),
              MenuList(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              }, 
              title: 'Location', 
              icon: Icons.map
            ),
              const Divider(
                color: Colors.blue,
              ),
              MenuList(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  title: 'Singin',
                  icon: Icons.app_registration),
              MenuList(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInPage()),
                    );
                  },
                  title: 'Login',
                  icon: Icons.login)
            ],
          ),
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.title,
    required this.press,
    required this.icon,
  });
  final String title;
  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: ListTile(
        title: Text(title),
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
