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
      home: DragDropExample(),
    );
  }
}

class DragDropExample extends StatefulWidget {
  const DragDropExample({super.key});

  @override
  State<DragDropExample> createState() => _DragDropExampleState();
}

class _DragDropExampleState extends State<DragDropExample> {
  Color targetColor = Colors.grey; // initial DragTarget color
  String targetText = "Drop Here"; // initial text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Draggable & DragTarget Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Draggable widget
            Draggable<String>(
              data: "dragged",
              child: Container(
                width: 120,
                height: 120,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Drag me",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              // 2. Feedback widget (semi-transparent)
              feedback: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    "Drag me",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              // Optional placeholder when being dragged
              childWhenDragging: Container(
                width: 120,
                height: 120,
                color: Colors.grey,
                alignment: Alignment.center,
                child: const Text("Dragging..."),
              ),
            ),

            const SizedBox(height: 50),

            // 3. DragTarget widget
            DragTarget<String>(
              onAccept: (data) {
                // 4. Change state when accepted
                setState(() {
                  targetColor = Colors.green;
                  targetText = "Dropped!";
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 150,
                  height: 150,
                  color: targetColor,
                  alignment: Alignment.center,
                  child: Text(
                    targetText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
