import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

BoxDecoration buildBoxDecorationAuthTextField() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  );
}
InputDecoration buildInputDecorationPasswordTextField(BuildContext context) {
  return InputDecoration(
    suffix: FaIcon(FontAwesomeIcons.burger,color: Colors.deepOrange),
    label: Text(
      AppLocalizations.of(context).passwordButtonTxt,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),

  );
}
InputDecoration buildInputDecorationMailTextField() {
  return InputDecoration(
    suffix: Icon(Icons.local_pizza_rounded,color: Colors.red),
    label: Text("Email"),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}