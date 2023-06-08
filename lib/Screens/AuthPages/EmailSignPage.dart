
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_do_cook/Screens/AuthPages/EmailSignUp.dart';
import 'package:i_do_cook/Screens/AuthPages/ResetPasswordPage.dart';
import 'package:i_do_cook/Screens/UserPages/AddingRecipePage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Services/AuthService.dart';
import '../../Styles/TexFieldStyles.dart';

import 'package:i_do_cook/HomePage.dart';
class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/white_Auth.gif"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 80,),
            // email
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
              child: Container(
                // to give Shodow
                decoration: buildBoxDecorationAuthTextField(),
                child: TextField(
                  decoration: buildInputDecorationMailTextField(),

                  onChanged: (email){
                    emailController.text=email;
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
              //  TO GIVE SHADOW
              child: Container(
                decoration: buildBoxDecorationAuthTextField(),
                //passwordTextField
                child: TextField(
                  obscureText: true,
                  decoration: buildInputDecorationPasswordTextField(context),
                  onChanged: (password){
                    passwordController.text=password;
                  },
                ),
              ),
            ),
            // LoginButton
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: ()
              async
              {
                try {
                  await Provider.of<Auth>(context,listen: false).signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                  );


                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateYourRecipe()));

                }

                on FirebaseAuthException catch (e) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(""),
                      content: Text(
                          AppLocalizations.of(context).alertDialogWarningUserNotFound
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text(
                              AppLocalizations.of(context).alertDialogOk
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
                child: Text(
                  AppLocalizations.of(context).loginButtonTxt
                ),
              ),
            ),
            // Forget password Button
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordPage()));
            }, child: Text(
              AppLocalizations.of(context).forgetPassword
            )),
            // Dont you have an account yet

            SizedBox(height: 10,),

            OutlinedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpWithEmail()));
            }, child: Text(
             AppLocalizations.of(context).dontYouHaveAnaAccount,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
            ))

          ],
        ),
      ),
    );
  }
}
