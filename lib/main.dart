import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uply/style.dart';
import 'package:uply/ui/SplashScreen.dart';
import 'package:uply/ui/home.dart';
import 'package:uply/ui/pages/signup.dart';
import 'package:uply/ui/pages/login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      initialRoute: '/login',
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new Login(),
        '/home' : (BuildContext context) => new Home(),
        '/signup' : (BuildContext context) => new SignUp(),
        '/splashScreen' : (BuildContext context) => new SplashScreen(),
      },
    );
  }
}
