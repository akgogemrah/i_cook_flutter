import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RecipeModel extends ChangeNotifier{
 String? imageUrl;
 String? recipeName;
 String? category;
 int score=0;
 String? id;
 CollectionReference recipes = FirebaseFirestore.instance.collection('Recipes');
RecipeModel({
   this.imageUrl,
   this.category,
   this.recipeName,
  this.id
});

 Future<void> Addrecipe() {
   return recipes
       .add({
     'imageUrl':imageUrl,
     'score':score,
     'recipeName':recipeName,
     'category':category
   })

       .then((value) => print("Recipe Added"))
       .catchError((error) => print("Failed to add imageUrl: $error"));
 }
 void addDocument(String collectionName) {
   FirebaseFirestore.instance
       .collection('Recipes')
       .doc()
       .set({
     'imageUrl': imageUrl,
     'score':score,
     'recipeName':recipeName,
     'category':category,
     'id':id
   })
       .then((value) => print('Doküman başarıyla eklendi.'))
       .catchError((error) => print('Doküman eklenirken hata oluştu: $error'));
 }



}