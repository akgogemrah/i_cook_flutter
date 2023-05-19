import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Services/AuthService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'EmailSignPage.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/Login1.png"
          ),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 300,
                  height: 230,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        AppLocalizations.of(context).createYourRecipes,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:40
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              AppLocalizations.of(context).shareYourRecipes,
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 18

              ),
            ),

            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  // phoneMockUp
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 500,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/mockup1_google-pixel5-justblack-portrait.png"
                          ),
                        )
                      ),


                    ),
                  ),
                  // emailLoginButton
                  Positioned(
                    left: 115,
                    bottom: 100,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white70
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailSignInPage()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.indigo,
                          ),
                          SizedBox(width: 20,),
                          Text(
                              AppLocalizations.of(context).loginWithEmail,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Google Login Button
                  Positioned(
                    left: 115,
                    bottom: 140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white70
                      ),
                      onPressed: () async {
                        await Provider.of<Auth>(context, listen: false).signInWithGoogle();
                      },
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.indigo,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            AppLocalizations.of(context).googleSignIn,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Container
                ], //<Widget>[]
              ), //Stack
            ),
          ],
        ),
      ),
    );
  }
}
