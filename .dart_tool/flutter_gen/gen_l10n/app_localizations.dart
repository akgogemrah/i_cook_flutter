import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// The current language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// A programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloworld;

  /// GoogleSignIn
  ///
  /// In en, this message translates to:
  /// **'Sign with Google'**
  String get googleSignIn;

  /// creating account button
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createYourAccount;

  /// No description provided for @alertDialogOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get alertDialogOk;

  /// Create Recipes
  ///
  /// In en, this message translates to:
  /// **'Please make sure to input correct format email or password'**
  String get alertDialogWarningUserEmail;

  /// No description provided for @loginWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Login With Email'**
  String get loginWithEmail;

  /// No description provided for @shareYourRecipes.
  ///
  /// In en, this message translates to:
  /// **'Share Your Recipes With Other People'**
  String get shareYourRecipes;

  /// No description provided for @createYourRecipes.
  ///
  /// In en, this message translates to:
  /// **'Create Your Own Recipes Collection'**
  String get createYourRecipes;

  /// No description provided for @loginButtonTxt.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonTxt;

  /// No description provided for @passwordButtonTxt.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordButtonTxt;

  /// No description provided for @alertDialogWarningUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found.Please make sure to input correct format email or password.'**
  String get alertDialogWarningUserNotFound;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password ?'**
  String get forgetPassword;

  /// send
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// alertDialogResetPasswordEmailValidateError
  ///
  /// In en, this message translates to:
  /// **'Please enter the validate e-mail'**
  String get alertDialogResetPasswordEmailValidateError;

  /// alertDialogResetPasswordEmailValidate
  ///
  /// In en, this message translates to:
  /// **'Your password link sended your email adress,please check your mail'**
  String get alertDialogResetPasswordEmailValidateSend;

  /// aresetPasswordEnterYourEmail
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email Adress'**
  String get resetPasswordEnterYourEmail;

  /// dontYouHaveAnaAccount
  ///
  /// In en, this message translates to:
  /// **'Dont you have an account yet ?'**
  String get dontYouHaveAnaAccount;

  /// YouHaveAnaAccount
  ///
  /// In en, this message translates to:
  /// **'Already you have an account ?'**
  String get alreadyHaveAccount;

  /// makeYourOwnFood
  ///
  /// In en, this message translates to:
  /// **'Cook Your Own Food'**
  String get makeYourOwnFood;

  /// prepareYourRecipe
  ///
  /// In en, this message translates to:
  /// **'Prepare Your Special Recipe'**
  String get prepareYourRecipe;

  /// prepareYourRecipeVideo
  ///
  /// In en, this message translates to:
  /// **'Take Your Recipe Video'**
  String get prepareYourRecipeVideo;

  /// orTakePictures
  ///
  /// In en, this message translates to:
  /// **'or take pictures'**
  String get orTakePictures;

  /// earnPoint
  ///
  /// In en, this message translates to:
  /// **'Earn Points and Stand Out With Your Points'**
  String get earnPoint;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
