import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
   String? email;
   String? password;
   UserModel({
      this.email,
      this.password
   });
   CollectionReference users = FirebaseFirestore.instance.collection('Users');
   Future<void> addUser() {
      return users
          .add({
         'email': email,
         'password':password,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
   }

}