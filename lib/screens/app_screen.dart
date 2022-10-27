import 'package:flutter/material.dart';
import 'package:nos_importas/screens/maps_screen.dart';
import 'package:nos_importas/screens/user_form_screen.dart';
import 'package:nos_importas/screens/button_emergency_screen.dart';
import 'package:nos_importas/screens/camera_function.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int currentPage = 1;
  final pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOS IMPORTAS"),
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const UserForm(),
          const MapsPage(),
          const PanicPage(),
          Imagen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;
          pageController.animateToPage(currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            activeIcon: Icon(Icons.verified_user_rounded),
            label: "Usuarios de confianza",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map_rounded),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dangerous_outlined),
            activeIcon: Icon(Icons.dangerous_rounded),
            label: "Boton de panico",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            activeIcon: Icon(Icons.camera_alt_rounded),
            label: "Camara",
          ),
        ],
      ),
    );
  }
}

class APageScreen extends StatelessWidget {
  final String page;

  const APageScreen({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(page.toString()),
    );
  }
}
