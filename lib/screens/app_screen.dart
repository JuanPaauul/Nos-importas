import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nos_importas/screens/maps/maps_screen.dart';
import 'package:nos_importas/screens/profile_screen.dart';
import 'package:nos_importas/screens/maps/screen_controller.dart';
import 'package:nos_importas/screens/user_confidence_list.dart';
import 'package:nos_importas/screens/user_form_screen.dart';
import 'package:nos_importas/screens/show_trust_users.dart';
import 'package:nos_importas/screens/button_emergency_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nos_importas/screens/camera_function.dart';
import 'package:nos_importas/screens/send_mail.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

enum options { A }

class _AppPageState extends State<AppPage> {
  //final _controller = ScreenController(Permission.locationAlways);
  //final _controller = ScreenController(Permission.locationWhenInUse);
  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.checkPermission();
    });
    _controller.addListener(() {
      if (_controller.routeName != null) {
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });*/
  }

  int currentPage = 1;
  final pageController = PageController(initialPage: 1);
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(42, 59, 113, 1),
        leading: PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry<options>>[
              const PopupMenuItem(child: Text("Here will come more options!")),
            ];
          },
        ),
        title: const Text("NOS IMPORTAS"),
        centerTitle: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              child: GestureDetector(),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const UserList(),
          const MapsPage(),
          const PanicPage(),
          const CameraPage(),
          const SendEmail(
            title: '',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: const Color.fromRGBO(53, 167, 219, 1),
        unselectedItemColor: const Color.fromRGBO(185, 223, 242, 1),
        onTap: (index) {
          currentPage = index;
          pageController.animateToPage(currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            activeIcon: Icon(Icons.admin_panel_settings),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            activeIcon: Icon(Icons.email_rounded),
            label: "Correo",
          ),
        ],
      ),
    );
  }
}
