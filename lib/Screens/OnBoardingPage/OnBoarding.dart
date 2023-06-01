import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:i_do_cook/HomePage.dart';
import 'package:i_do_cook/Screens/AuthPages/AuthPage.dart';
import 'package:provider/provider.dart';

import '../../Services/AuthService.dart';
import '../../Styles/OnboardingStyle/OnboardingStyle.dart';
import '../../Styles/TexFieldStyles.dart';
class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        controllerColor: Colors.black,
        headerBackgroundColor: buildOnBoardingPageBackGroundColor(),
        finishButtonText: AppLocalizations.of(context).loginButtonTxt,
        onFinish: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthPage()));
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        pageBackgroundColor: buildOnBoardingPageBackGroundColor(),
        skipTextButton: IconButton(
          icon: Icon(Icons.skip_next,color: Colors.black,size: 40),
          onPressed: (){},
        ),

        background: [
          Center(child: SizedBox(width: 400,child: Image.asset('assets/cooking_woman.png'))),
          Center(child: SizedBox(width: 400,child: Image.asset('assets/make_food.png'))),
          Center(child: SizedBox(width: 400,child: Image.asset('assets/create_video.png'))),
          Center(child: SizedBox(width: 400,child: Image.asset('assets/share_recipe.png'))),
        ],
        totalPage: 4,
        speed: 1.8,
        indicatorAbove: true,
        skipIcon: Icon(Icons.arrow_forward,color: Colors.white,),
        pageBodies: [
          // Page1
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).makeYourOwnFood,
                    style: buildOnBoardingBodyTextStyle(),
                  ),
                ),
              ],
            ),
          ),
          // PAGE 2
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                SizedBox(height: 50,),
                Text(
                  AppLocalizations.of(context).prepareYourRecipe,
                  style: buildOnBoardingBodyTextStyle(),
                ),
              ],
            ),
          ),
          // Page 3
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                SizedBox(height: 50,),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context).prepareYourRecipeVideo,
                      style: buildOnBoardingBodyTextStyle(),
                    ),
                    Text(
                      AppLocalizations.of(context).orTakePictures,
                      style: buildTextStyleOnboardingSmall(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Page 4
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 280,
                ),
                SizedBox(height: 50,),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context).shareYourRecipes,
                      style: buildOnBoardingBodyTextStyle(),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      AppLocalizations.of(context).earnPoint,
                      style: buildTextStyleOnboardingSmall(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color buildOnBoardingPageBackGroundColor() => Colors.white;
}