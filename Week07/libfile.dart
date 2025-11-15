import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
void main() {
  runApp(FileApp());
}
class FileApp extends StatefulWidget {
  @override
  _FileAppState createState() => _FileAppState();
}
class _FileAppState extends State<FileApp> {
  String fileContent = "No data yet";
    Future<String> getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/myfile.txt';
  }
  Future<void> writeFile(String data) async {
    final path = await getFilePath();
    final file = File(path);
    await file.writeAsString(data);
  }
  Future<void> readFile() async {
    try {
      final path = await getFilePath();
      final file = File(path);
      String content = await file.readAsString();
      setState(() {
        fileContent = content;
      });
    } catch (e) {
      setState(() {
        fileContent = "Error reading file";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("File Read/Write Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(fileContent),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => writeFile("Hello Flutter!"),
                child: Text("Write to File"),
              ),
              ElevatedButton(
                onPressed: () => readFile(),
                child: Text("Read from File"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
