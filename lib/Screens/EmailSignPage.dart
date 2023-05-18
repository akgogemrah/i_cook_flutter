import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/AuthService.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    return Scaffold(
      body: ListView(
        children: [
          // email
          TextField(
            onChanged: (email){
              emailController.text=email;

            },
          ),
          TextField(
            onChanged: (password){
              passwordController.text=password;
            },
          ),
          ElevatedButton(onPressed: ()
          async{
            await Provider.of<Auth>(context,listen: false).signInWithEmailAndPassword(
                emailController.text,
                passwordController.text,
            );
          },

            child: Text(
              "Giriş Yap"
            ),
          ),
        ],
      ),
    );
  }
}
