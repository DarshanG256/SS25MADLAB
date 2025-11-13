import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade-In Animation Demo',
      debugShowCheckedModeBanner: false,
      home: FadeInScreen(),
    );
  }
}

class FadeInScreen extends StatefulWidget {
  @override
  _FadeInScreenState createState() => _FadeInScreenState();
}

class _FadeInScreenState extends State<FadeInScreen> {
  // 1. Boolean variable for visibility
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // 2. Change visibility after 1 second
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade-In Animation'),
        centerTitle: true,
      ),
      body: Center(
        // 3. AnimatedOpacity widget
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0, // 4. Fade logic
          duration: Duration(seconds: 1), // 1-second fade-in
          // 5. Child widget (any widget can go here)
          child: Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
