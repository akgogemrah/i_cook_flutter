import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: OutlinedButton(onPressed: () {

        }, child: Text(
          "Google-Sign"
        ),),
      ),

    );
  }
}
