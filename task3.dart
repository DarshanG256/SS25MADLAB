import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Action Buttons Row',
      debugShowCheckedModeBanner: false,
      home: ActionButtonsScreen(),
    );
  }
}

class ActionButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action Buttons'),
        centerTitle: true,
      ),
      body: Center(
        // 1. Place a Row widget in the center
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 3. Even spacing
          children: [
            // 2. Three IconButtons
            IconButton(
              icon: Icon(Icons.call, size: 32, color: Colors.green),
              onPressed: () {
                print('Call Button Pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.message, size: 32, color: Colors.blue),
              onPressed: () {
                print('Message Button Pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.email, size: 32, color: Colors.red),
              onPressed: () {
                print('Email Button Pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
