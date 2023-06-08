import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:i_do_cook/HomePage.dart';
import 'package:i_do_cook/Model/RecipeModel.dart';
import 'package:i_do_cook/Model/UserModel.dart';
import 'package:i_do_cook/Screens/AuthPages/EmailSignPage.dart';
import 'package:i_do_cook/Screens/OnBoardingPage/OnBoarding.dart';
import 'package:i_do_cook/Screens/UserPages/AddingRecipePage.dart';
import 'package:i_do_cook/Widgets/OnBoardWidget.dart';
import 'package:provider/provider.dart';
import 'Screens/AuthPages/AuthPage.dart';
import 'Services/AuthService.dart';
import 'l10n/l10.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Auth()),
    ChangeNotifierProvider(create: (context) => UserModel()),
    ChangeNotifierProvider(create: (context) => RecipeModel()),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Localization arrangements
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: L10.all,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home:AuthPage()

    );
  }
}




