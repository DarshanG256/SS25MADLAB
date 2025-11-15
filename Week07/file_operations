import 'package:flutter/material.dart';
import 'repository/file_operations.dart';  // import the functions

void main() {
  runApp(const FileApp());
}

class FileApp extends StatelessWidget {
  const FileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FileHomePage(),
    );
  }
}

class FileHomePage extends StatefulWidget {
  const FileHomePage({super.key});

  @override
  State<FileHomePage> createState() => _FileHomePageState();
}

class _FileHomePageState extends State<FileHomePage> {
  final TextEditingController controller = TextEditingController();
  String loadedText = "";

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  Future<void> _loadSavedText() async {
    final text = await readFromFile();
    setState(() {
      loadedText = text;
      controller.text = text;
    });
  }

  Future<void> _saveText() async {
    await writeToFile(controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Saved Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text File Storage"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Enter text to save...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveText,
                  child: const Text("Save"),
                ),

                ElevatedButton(
                  onPressed: _loadSavedText,
                  child: const Text("Load"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "Loaded Text:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              loadedText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
