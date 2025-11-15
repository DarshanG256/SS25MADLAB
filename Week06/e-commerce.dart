import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceHubApp());
}

class EcommerceHubApp extends StatelessWidget {
  const EcommerceHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // STEP 1: Routes Map
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainHub(selectedIndex: 0),
        '/cart': (context) => const MainHub(selectedIndex: 1),
        '/profile': (context) => const MainHub(selectedIndex: 2),
      },
    );
  }
}

class MainHub extends StatefulWidget {
  final int selectedIndex;
  const MainHub({super.key, required this.selectedIndex});

  @override
  State<MainHub> createState() => _MainHubState();
}

class _MainHubState extends State<MainHub> {
  late int currentIndex;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    // STEP 3: Navigate using named routes
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/cart');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STEP 4: Keep pages alive
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// -------------------------
// 📌 HOME PAGE
// -------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(
        child: Text(
          "🏠 Home Page",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

// -------------------------
// 📌 CART PAGE
// -------------------------
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: const Center(
        child: Text(
          "🛒 Cart Page",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

// -------------------------
// 📌 PROFILE PAGE
// -------------------------
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(
        child: Text(
          "👤 Profile Page",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
