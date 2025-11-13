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
      home: ColorToggler(),
    );
  }
}

class ColorToggler extends StatefulWidget {
  const ColorToggler({super.key});

  @override
  State<ColorToggler> createState() => _ColorTogglerState();
}

class _ColorTogglerState extends State<ColorToggler> {
  // 1. Create background color variable
  Color _backgroundColor = Colors.white;

  // Function to toggle colors
  void _toggleColor() {
    setState(() {
      _backgroundColor =
          _backgroundColor == Colors.white ? Colors.blue : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. Set Scaffold background color
      backgroundColor: _backgroundColor,
      appBar: AppBar(title: const Text("Color Toggler Example")),
      body: const Center(
        child: Text(
          "Press the button to toggle color!",
          style: TextStyle(fontSize: 18),
        ),
      ),
      // 3. Add FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor, // 4. Toggle color using setState()
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
