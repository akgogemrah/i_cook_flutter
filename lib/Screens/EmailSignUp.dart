import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_do_cook/Model/UserModel.dart';
import 'package:i_do_cook/Services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({Key? key}) : super(key: key);
  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}
class _SignUpWithEmailState extends State<SignUpWithEmail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            //email textField
            TextField(
              controller: emailController,
              onChanged: (email){
                Provider.of<UserModel>(context,listen: false).email=email;
              },
            ),
            //passwordTextField
            TextField(
              controller: passwordController,
              onChanged: (password){
                Provider.of<UserModel>(context,listen: false).password=password;
                print(Provider.of<UserModel>(context,listen: false).email);
                print(Provider.of<UserModel>(context,listen: false).password);
              },
            ),
            ElevatedButton(onPressed: ()async{

              if(EmailValidator.validate(emailController.text)){
                await Provider.of<Auth>(context,listen: false).createUserWithEmailAndPassword(
                    Provider.of<UserModel>(context,listen: false).email!,
                    Provider.of<UserModel>(context,listen: false).password!
                );
                Provider.of<UserModel>(context,listen: false).addUser();
              }
              else{
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(""),
                    content: Text(
                      AppLocalizations.of(context).alertDialogWarningUserEmail
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
            }, child: Text(
              AppLocalizations.of(context).createYourAccount
            ))
          ],
        ),
      ),
    );
  }
}
