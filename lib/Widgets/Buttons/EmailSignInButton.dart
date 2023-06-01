import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Screens/AuthPages/EmailSignPage.dart';
ElevatedButton EmailSignInButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.white70
    ),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailSignInPage()));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.email,
          color: Colors.red,
        ),
        SizedBox(width: 20,),
        Center(
          child: Text(
            AppLocalizations.of(context).loginWithEmail,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ],
    ),
  );
}