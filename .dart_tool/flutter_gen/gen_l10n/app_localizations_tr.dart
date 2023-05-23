import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get language => 'Türkçe';

  @override
  String get helloworld => 'Merhaba Dünya!';

  @override
  String get googleSignIn => 'Google ile Giriş Yap';

  @override
  String get createYourAccount => 'Hesap Oluştur';

  @override
  String get alertDialogOk => 'Tamam';

  @override
  String get alertDialogWarningUserEmail => 'Email yada şifrenizi doğru formatta giriniz.(şifre en az 6 kkarakterli olmalıdır)';

  @override
  String get loginWithEmail => 'Email ile Giriş Yap';

  @override
  String get shareYourRecipes => 'Tariflerini Diğer İnsanlarla Paylaş';

  @override
  String get createYourRecipes => 'Kendi Yemek Tarifi Koleksiyonunu Oluştur';

  @override
  String get loginButtonTxt => 'Giriş Yap';

  @override
  String get passwordButtonTxt => 'Şifre';

  @override
  String get alertDialogWarningUserNotFound => 'Kullanıcı bulunamadı, lütfen email yada şifrenizi doğru girdiğinizden emin olun';

  @override
  String get forgetPassword => 'Şifremi Unuttum';

  @override
  String get send => 'Gönder';

  @override
  String get alertDialogResetPasswordEmailValidateError => 'Lütfen geçerli bir mail adresi giriniz';

  @override
  String get alertDialogResetPasswordEmailValidateSend => 'Şifre yenileme linki mail adresine gönderildi';

  @override
  String get resetPasswordEnterYourEmail => 'Mail Adresinizi Giriniz';

  @override
  String get dontYouHaveAnaAccount => 'Henüz hesabınız yok mu ?';

  @override
  String get alreadyHaveAccount => 'Zaten bir hesabın var mı ?';

  @override
  String get makeYourOwnFood => 'Yemeğini Pişir';

  @override
  String get prepareYourRecipe => 'Özel Tarifini Hazırla';

  @override
  String get prepareYourRecipeVideo => 'Tarif Videonu Hazırla';

  @override
  String get orTakePictures => 'ya da fotoğraflarını çek';

  @override
  String get earnPoint => 'Puanlar Kazan ve Puanlarınla Öne Çık';
}
