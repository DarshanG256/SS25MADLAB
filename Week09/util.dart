import 'package:firebase_database/firebase_database.dart';

class FirebaseUtil {
  final DatabaseReference _rootRef = FirebaseDatabase.instance.ref();

  DatabaseReference get rootRef => _rootRef;

  Future<void> writeData(String key, Map<String, dynamic> data) async {
    await _rootRef.child(key).set(data);
  }
}
