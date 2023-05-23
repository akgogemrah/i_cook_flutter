import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get helloworld => 'Hello World!';

  @override
  String get googleSignIn => 'Sign with Google';

  @override
  String get createYourAccount => 'Create your account';

  @override
  String get alertDialogOk => 'Ok';

  @override
  String get alertDialogWarningUserEmail => 'Please make sure to input correct format email or password';

  @override
  String get loginWithEmail => 'Login With Email';

  @override
  String get shareYourRecipes => 'Share Your Recipes With Other People';

  @override
  String get createYourRecipes => 'Create Your Own Recipes Collection';

  @override
  String get loginButtonTxt => 'Login';

  @override
  String get passwordButtonTxt => 'Password';

  @override
  String get alertDialogWarningUserNotFound => 'User not found.Please make sure to input correct format email or password.';

  @override
  String get forgetPassword => 'Forget password ?';

  @override
  String get send => 'Send';

  @override
  String get alertDialogResetPasswordEmailValidateError => 'Please enter the validate e-mail';

  @override
  String get alertDialogResetPasswordEmailValidateSend => 'Your password link sended your email adress,please check your mail';

  @override
  String get resetPasswordEnterYourEmail => 'Enter Your Email Adress';

  @override
  String get dontYouHaveAnaAccount => 'Dont you have an account yet ?';

  @override
  String get alreadyHaveAccount => 'Already you have an account ?';

  @override
  String get makeYourOwnFood => 'Cook Your Own Food';

  @override
  String get prepareYourRecipe => 'Prepare Your Special Recipe';

  @override
  String get prepareYourRecipeVideo => 'Take Your Recipe Video';

  @override
  String get orTakePictures => 'or take pictures';

  @override
  String get earnPoint => 'Earn Points and Stand Out With Your Points';
}
