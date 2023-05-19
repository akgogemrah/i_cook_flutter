import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:i_do_cook/Model/UserModel.dart';
import 'package:i_do_cook/Screens/AuthPage.dart';
import 'package:i_do_cook/Screens/EmailSignPage.dart';
import 'package:i_do_cook/Screens/EmailSignUp.dart';
import 'package:i_do_cook/Services/AuthService.dart';
import 'package:provider/provider.dart';
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
        // Note: "useMaterial3" is not a valid property for the "theme" attribute.
        // If you are using Material Design 3.0, you don't need to specify this property.
      ),
      home: AuthPage(),
    );
  }
}




