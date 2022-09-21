import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final pageController = new PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola mundo"),
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          APageScreen(
            page: 1,
          ),
          APageScreen(
            page: 2,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;
          pageController.animateToPage(currentPage,
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          print(currentPage);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
    );
  }
}

class APageScreen extends StatelessWidget {
  final int page;

  const APageScreen({required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(page.toString()),
      ),
    );
  }
}
