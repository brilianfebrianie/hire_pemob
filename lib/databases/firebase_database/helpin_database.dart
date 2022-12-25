import 'package:cloud_firestore/cloud_firestore.dart';

class HelpInDatabse {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference tasks = firestore.collection('tasks');
}
