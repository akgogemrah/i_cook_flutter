import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
class FirebaseStorageService extends ChangeNotifier{
 static FirebaseStorage storage = FirebaseStorage.instance;
  final storageRef =storage.ref();
  
}