import 'package:build_hire_app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference users = firestore.collection('users');

  static void register(String name, String email, String phoneNumber) {
    users.add({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthPlace': 'Not Specified',
      'birthDate': 'Not Specified',
      'gender': 'Not Specified',
      'profession': 'Not Specified',
      'address': 'Not Specified'
    });
  }

  static void regist(User user) {
    users.add(user.toJson());
  }
}
