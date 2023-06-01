import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Services/AuthService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/Buttons/EmailSignInButton.dart';
import '../../Widgets/Buttons/Google_SignInButton.dart';
import 'EmailSignPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  State<AuthPage> createState() => _AuthPageState();
}
class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {


    final Size size = MediaQuery.of(context).size;
    final bool isLargeScreen = size.width > 600;
    // Background Container
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              // BackgroundImage
              "assets/white_Auth.gif"
            ),
            fit: BoxFit.cover
          )
        ),
        //Scaffold
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: 300,
                    height: 230,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        //Create Your Recipe Collection
                        Text(
                          AppLocalizations.of(context).createYourRecipes,
                          style: TextStyle(
                            color: AuthPagetxt,
                            fontSize:40
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Share Your Recipes Collection
              Text(
                AppLocalizations.of(context).shareYourRecipes,
                style: TextStyle(
                  color:AuthPagetxt,
                  fontSize: 18

                ),
              ),
              SizedBox(height: 30,),
              //SigningGoogle
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: GoogleSignInButton(context),
              ),
              //SigningEmail
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: EmailSignInButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }




}
Color AuthPagetxt=Colors.black;