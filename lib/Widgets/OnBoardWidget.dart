import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_do_cook/Screens/AuthPages/AuthPage.dart';
import 'package:i_do_cook/Screens/OnBoardingPage/OnBoarding.dart';
import 'package:provider/provider.dart';

import '../HomePage.dart';
import '../Services/AuthService.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User?>(
        stream: _auth.authStatus(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return snapshot.data != null ? HomePage() : OnBoarding();
          } else {
            return SizedBox(
              height: 300,
              width: 300,
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
