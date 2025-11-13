import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      debugShowCheckedModeBanner: false,
      home: BottomNavExample(),
    );
  }
}

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  // 2. Define current index
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 6. Conditional display based on _currentIndex
    Widget bodyContent;
    if (_currentIndex == 0) {
      bodyContent = Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    } else if (_currentIndex == 1) {
      bodyContent = Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      bodyContent = Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
        centerTitle: true,
      ),
      body: bodyContent,

      // 3. Add BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 4. Link current index
        onTap: (index) {
          // 5. Update index on tap
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
