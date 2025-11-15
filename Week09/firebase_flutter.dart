import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with web config
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'YOUR API KEY',
      authDomain: ‘your Auth domain',
      databaseURL: ‘ your database url ',
      projectId: 'your project-id',
   storageBucket:'your storage bucket',
      messagingSenderId: 'your id',
   appId: 'your app id',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Registration',
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseUtil _firebaseUtil = FirebaseUtil();

  @override
  void dispose() {
    _nameController.dispose();
    _rollController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitData() {
    final name = _nameController.text.trim();
    final roll = _rollController.text.trim();
    final email = _emailController.text.trim();

    if (name.isEmpty || roll.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    // Using timestamp as key
    String key = DateTime.now().millisecondsSinceEpoch.toString();

    _firebaseUtil.writeData(key, {
      'name': name,
      'roll_no': roll,
      'email': email,
      'timestamp': DateTime.now().toIso8601String(),
    });

    _nameController.clear();
    _rollController.clear();
    _emailController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Registration submitted')));
  }

  Widget _buildDataList() {
    return StreamBuilder<DatabaseEvent>(
      stream: _firebaseUtil.rootRef.onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return Center(child: Text('No registrations found'));
        }

        final dbSnapshot = snapshot.data!.snapshot;
        final value = dbSnapshot.value;

        if (value is! Map) {
          return Center(child: Text('Unexpected data format'));
        }

        Map<dynamic, dynamic> map = value as Map<dynamic, dynamic>;
        final entries = map.entries.toList();

        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (ctx, idx) {
            final key = entries[idx].key;
            final item = entries[idx].value;
            String display = '';

            if (item is Map) {
              display =
                  'Name: ${item['name'] ?? ''}, Roll No: ${item['roll_no'] ?? ''}, Email: ${item['email'] ?? ''}';
            } else {
              display = item.toString();
            }

            return ListTile(
              leading: Text(key.toString()),
              title: Text(display),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _rollController,
              decoration: InputDecoration(
                labelText: 'Roll Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Register'),
            ),
            SizedBox(height: 16),
            Expanded(child: _buildDataList()),
          ],
        ),
      ),
    );
  }
}
 
