import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_do_cook/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Services/AuthService.dart';

ElevatedButton GoogleSignInButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.white70
    ),
    onPressed: () async {
      try {
        await Provider.of<Auth>(context, listen: false).signInWithGoogle();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      } on FirebaseAuthException catch (e) {
        // TODO
        print(e);
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.google,
          color: Colors.indigo,
        ),
        SizedBox(width: 20,),
        Center(
          child: Text(
            AppLocalizations.of(context).googleSignIn,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),
          ),
        ),
      ],
    ),
  );
}