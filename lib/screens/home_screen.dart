import 'package:flutter/material.dart';
import 'package:nos_importas/screens/login_form_screen.dart';
import 'package:nos_importas/screens/sign_up_screen.dart';
import 'package:nos_importas/screens/user_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola mundo"),
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const UserForm(),
          const SignUpPage(),
          const LoginPage(),
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
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: "Sign Up",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login_outlined),
            label: "Login",
          )
        ],
      ),
    );
  }
}

class APageScreen extends StatelessWidget {
  final int page;

  const APageScreen({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(page.toString()),
    );
  }
}
