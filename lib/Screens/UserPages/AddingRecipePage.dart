import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_do_cook/Model/RecipeModel.dart';
import 'package:i_do_cook/Widgets/DropDown/categoryDropdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class CreateYourRecipe extends StatefulWidget {
  const CreateYourRecipe({Key? key}) : super(key: key);

  @override
  State<CreateYourRecipe> createState() => _CreateYourRecipeState();
}

class _CreateYourRecipeState extends State<CreateYourRecipe> {
  TextEditingController recipeNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownCategory(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                suffix: Icon(Icons.local_pizza_rounded),
                hintText: "Food Name"
              ),
              controller: recipeNameController,
              onChanged: (name){
                Provider.of<RecipeModel>(context,listen: false).recipeName=name;
              }
            ),
          ),
          Center(
            child: IconButton(icon: Icon(Icons.camera_alt),onPressed: ()async{
              ImagePicker imagePicker=ImagePicker();
           XFile? file= await imagePicker.pickImage(source: ImageSource.camera);
           print(file?.path);
           if(file==null)return;
           String uniqeFileName=DateTime.now().microsecondsSinceEpoch.toString();

           // to get a refference root
              Reference refferenceRoot=FirebaseStorage.instance.ref();
              Reference refferenceDirImages=refferenceRoot.child('images');
              // create refference for the image to stored
              Reference refferenceImageToUpload=refferenceDirImages.child(uniqeFileName);
              // Store the File
              try {
              await  refferenceImageToUpload.putFile(File(file!.path));
                // Succes: getDownLoadUrl
              Provider.of<RecipeModel>(context,listen: false).imageUrl=await refferenceImageToUpload.getDownloadURL();


              }  catch (error) {
              }


            }, ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Provider.of<RecipeModel>(context,listen: false).id=FirebaseAuth.instance.currentUser?.uid;
              Provider.of<RecipeModel>(context,listen: false).score=Provider.of<RecipeModel>(context,listen: false).score;
              Provider.of<RecipeModel>(context,listen: false).
              addDocument("Recipes");
            },child: Text("Add To Recipe")),
          ),
        ],
      ),
    );
  }
}
