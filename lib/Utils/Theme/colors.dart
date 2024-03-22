import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/Utils/constant/local_db_handler.dart';

class AppColor with ChangeNotifier {
  LocalHandler localHandler = LocalHandler();
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get getTheme => _themeMode;
  setTheme(ThemeMode themeMode) async {
    LocalHandler.setTheme(themeMode.name);
    _themeMode = themeMode;
    if (themeMode == ThemeMode.dark) {
      screenBG = const Color(0xffFFFFFF);
      white = Colors.black;
      primaryColor = const Color(0xffFFFFFF);
      darkgrey = Colors.white;
      lightText = Colors.black;
      offwhite = Colors.black;
      darkgrey = Colors.white;
      onBoard = Color(0xFF12305B);
      onBoard = Color(0xffFFFFFF);
      textColor = Color(0xffFFFFFF);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: primaryColor,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      screenBG = const Color(0xff0D2444);
      primaryColor = const Color(0xff12305B);
      white = Colors.white;
      darkgrey = const Color(0xFF000000);
      lightText = Color(0xffFAFAFA);
      offwhite = const Color(0xffE7EAEF);
      darkgrey = const Color(0xff90A3BF);
      onBoard = Color(0xFF12305B);
      textColor = Color(0xff3263B0);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: primaryColor,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
    notifyListeners();
  }

  static Color screenBG = Color(0xff0D2444);
  static Color secondaryColor = const Color(0xff0D2444);
  static Color primaryColor = Color(0xff12305B);
  static Color white = const Color(0xffFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color offwhite = const Color(0xffE7EAEF);
  static const Color lightPrimary = Color(0xff3CFEDE);
  static const Color darkPrimary = Color(0xff3263B0);
  static Color textColor = Color(0xff3263B0);
  static Color lightText = Color(0xffFAFAFA);
  static Color darkgrey = const Color(0xff424242);
  static const Color orange = Color(0xFFF6A826);
  static const Color lightAmber = Color(0xffF9B527);
  static const Color darkAmber = Color(0xffF7631D);
  static Color lightgrey = const Color(0xffA0ACBD);
  static const Color red = Color(0xFFF75555);
  static Color onBoard = Color(0xFF12305B);

//linear gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xff3263B0),
      Color(0xff3CFEDE),
    ],
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
