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
      home: const MoodLifterProfileCard(),
    );
  }
}

class MoodLifterProfileCard extends StatefulWidget {
  const MoodLifterProfileCard({super.key});

  @override
  State<MoodLifterProfileCard> createState() => _MoodLifterProfileCardState();
}

class _MoodLifterProfileCardState extends State<MoodLifterProfileCard> {
  bool isHappy = false; // mood state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text("Mood-Lifter Profile Card"),
      ),

      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isHappy = !isHappy;
            });
          },

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,

            padding: const EdgeInsets.all(20),
            width: 280,
            decoration: BoxDecoration(
              color: isHappy ? Colors.yellow[200] : Colors.blue[100],
              borderRadius: BorderRadius.circular(isHappy ? 30 : 10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: isHappy ? 30 : 10,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated Avatar Container
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: isHappy ? 130 : 110,
                  width: isHappy ? 130 : 110,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isHappy ? Colors.orange : Colors.blueGrey,
                      width: 4,
                    ),
                    image: const DecorationImage(
                      image: AssetImage("assets/profile.jpg"), // Ensure asset exists
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Name
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Animated Bio Text
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isHappy ? 1.0 : 0.5,

                  child: Text(
                    isHappy
                        ? "Feeling awesome today! 😄"
                        : "Just a normal day... 😐",
                    style: TextStyle(
                      fontSize: 16,
                      color: isHappy ? Colors.black : Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 15),

                // Mood Icon
                Icon(
                  isHappy ? Icons.sentiment_very_satisfied : Icons.sentiment_satisfied,
                  size: 40,
                  color: isHappy ? Colors.orange : Colors.grey[700],
                ),

                const SizedBox(height: 8),

                Text(
                  isHappy ? "Tap to Relax" : "Tap to Lift Mood",
                  style: TextStyle(
                    color: isHappy ? Colors.orange : Colors.blueGrey,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
