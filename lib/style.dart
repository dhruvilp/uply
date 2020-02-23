import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Palette
const cyan_dark = const Color(0xFF114B5F);
const cyan = const Color(0xFF028090);
const pink = const Color(0xFFe06666);
const pink_light = const Color(0xFFf57878);

/// Triage Colors
const red = const Color(0xFFcc0000);
const red_light = const Color(0xFFdb4c4c);
const yellow = const Color(0xFFf2b022);
const yellow_light = const Color(0xFFf5c152);
const green = const Color(0xFF359935);
const green_light = const Color(0xFF3caf3c);

/// Black & White
const white = Colors.white;
const grey_light = const Color(0xFFe1e6e8);
const grey = const Color(0xFF898c8c);
const grey_mid = const Color(0xFF666666);
const charcoal_light = const Color(0xFF4a4a4a);
const charcoal = const Color(0xFF292929);
const charcoal_dark = const Color(0xFF1A1A1A);
const black = Colors.black;
const semi_transparent = Colors.black87;
const transparent = const Color(0x00ffffff);
const box_shadow = const Color(0x0d000000);
const overlay = const Color.fromRGBO(0, 0, 0, 80);

/// Gradient Colors
const cyan_gradient = const LinearGradient(
  colors: [pink_light, red_light],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);

/// Themes
final kLightTheme = _buildLightTheme();
final kDarkTheme = _buildDarkTheme();

///---------------------------------------
///             LIGHT THEME
///---------------------------------------
ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    primaryColor: grey_mid,
    primaryColorLight: white,
    primaryColorDark: charcoal_light,
    accentColor: pink,
    backgroundColor: white,
    scaffoldBackgroundColor: white,
    canvasColor: transparent,
    fontFamily: 'Quicksand',
    dividerTheme: DividerThemeData(
      color: grey_light,
      thickness: 2.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: grey_mid, width: 0.0),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      fillColor: pink,
      labelStyle: TextStyle(
        color: grey_mid,
      ),
    ),
    textTheme: TextTheme(
      display4: TextStyle(fontSize: 100.0, color: charcoal_light, fontWeight: FontWeight.bold,),
      display3: TextStyle(fontSize: 90.0, color: charcoal_light, fontWeight: FontWeight.bold,),
      display2: TextStyle(fontSize: 60.0, color: grey_mid, fontWeight: FontWeight.bold,),
      display1: TextStyle(fontSize: 35.0, color: charcoal_light, fontWeight: FontWeight.bold,),
      headline: TextStyle(fontSize: 25.0, color: charcoal_light, fontWeight: FontWeight.w700,),
      title: TextStyle(fontSize: 20.0, color: pink, fontWeight: FontWeight.w700,),
      subhead: TextStyle(fontSize: 18.0, color: charcoal_light, fontWeight: FontWeight.w700,),
      body2: TextStyle(color: grey,),
      body1: TextStyle(color: grey,),
    ),
  );

  return base;
}

///---------------------------------------
///             DARK THEME
///---------------------------------------
ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    primaryColor: pink_light,
    primaryColorLight: grey,
    primaryColorDark: pink,
    accentColor: pink,
    backgroundColor: charcoal,
    scaffoldBackgroundColor: charcoal,
    canvasColor: transparent,
    fontFamily: 'Quicksand',
    dividerTheme: DividerThemeData(
      color: charcoal_light,
      thickness: 2.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: pink_light, width: 0.0),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      fillColor: pink,
      labelStyle: TextStyle(
        color: pink_light,
      ),
    ),
    textTheme: TextTheme(
      display4: TextStyle(fontSize: 100.0, color: pink_light, fontWeight: FontWeight.bold,),
      display3: TextStyle(fontSize: 90.0, color: pink_light, fontWeight: FontWeight.bold,),
      display2: TextStyle(fontSize: 60.0, color: pink_light, fontWeight: FontWeight.bold,),
      display1: TextStyle(fontSize: 35.0, color: pink_light, fontWeight: FontWeight.bold,),
      headline: TextStyle(fontSize: 25.0, color: white, fontWeight: FontWeight.w200,),
      title: TextStyle(fontSize: 20.0, color: pink_light, fontWeight: FontWeight.w200,),
      subhead: TextStyle(fontSize: 18.0, color: white,),
      body2: TextStyle(color: pink_light,),
      body1: TextStyle(color: white,),
    ),
  );

  return base;
}