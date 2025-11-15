import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllTasksScreen(),
    );
  }
}
// This screen combines all three sub-task widgets.
class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 1.1: SafeArea and AppBar are implemented here.
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Combined Widgets"),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        // A scroll view prevents content from overflowing on small screens.
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // 1.1: Main Column for the scaffold body.
            child: Column(
              children: const [
                ProfileCard(),
                Divider(height: 40, thickness: 1),
                RatingWidget(),
                Divider(height: 40, thickness: 1),
                ContentToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
