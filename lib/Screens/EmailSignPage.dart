
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_do_cook/Screens/ResetPasswordPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Services/AuthService.dart';
class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key? key}) : super(key: key);
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
                decoration: BoxDecoration(
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
                ),
                child: TextField(
                  decoration: InputDecoration(
                    suffix: Icon(Icons.local_pizza_rounded,color: Colors.red),
                    label: Text("Email"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

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
                decoration: BoxDecoration(
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
                ),
                //passwordTextField
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    suffix: FaIcon(FontAwesomeIcons.burger,color: Colors.deepOrange),
                    label: Text(
                      AppLocalizations.of(context).passwordButtonTxt,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                  ),
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
                } on FirebaseAuthException catch (e) {
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
            ))
          ],
        ),
      ),
    );
  }
}
