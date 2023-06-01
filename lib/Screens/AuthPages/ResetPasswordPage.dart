import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Services/AuthService.dart';
import 'EmailSignPage.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    String email;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context).resetPasswordEnterYourEmail,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: emailController,
                onChanged: (mail){
                  email=mail;
                },
                decoration: InputDecoration(
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.mail,color: Colors.deepOrange,),
                  )
                ),
              ),
            ),
            OutlinedButton(onPressed: ()async{
              if(EmailValidator.validate(emailController.text)){
                await Provider.of<Auth>(context,listen: false).firebaseAuth.sendPasswordResetEmail(email: emailController.text);
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(""),
                    content: Text(
                        AppLocalizations.of(context).alertDialogResetPasswordEmailValidateSend
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailSignInPage()));
                        },
                        child: Text(
                            AppLocalizations.of(context).alertDialogOk
                        ),
                      ),
                    ],
                  ),
                );
              }
              else
                {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(""),
                      content: Text(
                          AppLocalizations.of(context).alertDialogResetPasswordEmailValidateError
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
              AppLocalizations.of(context).send
            ))
          ],
        ),
      ),
    );
  }
}
