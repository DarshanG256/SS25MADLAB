import 'package:flutter/material.dart';
import 'dart:math'; // for random sizes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // 1. Define initial width and height
  double _width = 100;
  double _height = 100;
  final Random _random = Random();
  Color _color = Colors.blue;

  void _changeSize() {
    setState(() {
      // 4. Change width, height, and color
      _width = 100 + _random.nextInt(100).toDouble(); // between 100–200
      _height = 100 + _random.nextInt(100).toDouble();
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Container Example")),
      body: Center(
        // 2. Use AnimatedContainer
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: const Duration(seconds: 1), // smooth 1s animation
          curve: Curves.easeInOut,
          child: const Center(
            child: Text(
              "Tap Button!",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      // 3. FloatingActionButton to trigger animation
      floatingActionButton: FloatingActionButton(
        onPressed: _changeSize,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
