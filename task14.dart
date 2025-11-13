import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Wrap everything in DefaultTabController
    return DefaultTabController(
      length: 2, // 2. Two tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar Example"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats", icon: Icon(Icons.chat)),
              Tab(text: "Status", icon: Icon(Icons.info)),
            ],
          ),
        ),
        // 4. TabBarView with two screens
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                "Chats Screen",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "Status Screen",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
