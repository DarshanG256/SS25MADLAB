import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      debugShowCheckedModeBanner: false,
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'),
        centerTitle: true,
      ),
      // 1. Use a ListView.builder as the body
      body: ListView.builder(
        itemCount: 10, // 2. Define itemCount
        itemBuilder: (context, index) {
          // 3. Return a ListTile for each item
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Item ${index + 1}'), // 4. Set ListTile title
            subtitle: Text('This is the description for item ${index + 1}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print('Tapped on Item ${index + 1}');
            },
          );
        },
      ),
    );
  }
}
