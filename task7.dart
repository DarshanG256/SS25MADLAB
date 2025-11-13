import 'package:flutter/material.dart';
import 'dart:convert'; // For json.decode()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON List Example',
      debugShowCheckedModeBanner: false,
      home: JsonListScreen(),
    );
  }
}

class JsonListScreen extends StatelessWidget {
  // 1. Define a local JSON string
  final String jsonString = '''
  [
    {"name": "Apple"},
    {"name": "Banana"},
    {"name": "Cherry"},
    {"name": "Grapes"},
    {"name": "Orange"}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    // 2. Parse the JSON string into a list
    List<dynamic> fruits = json.decode(jsonString);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits List from JSON'),
        centerTitle: true,
      ),
      // 3. Display the list using ListView.builder
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          var fruit = fruits[index];
          return ListTile(
            leading: Icon(Icons.local_grocery_store),
            title: Text(fruit['name']),
          );
        },
      ),
    );
  }
}
