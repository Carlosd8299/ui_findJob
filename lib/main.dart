import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_findjob/models/size_config.dart';
import 'package:ui_findjob/screens/mainScreen.dart';
import "./screens/splash.dart";
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: MainScreen(),
          theme: ThemeData(
            primaryColor: Colors.deepPurple[800],
            accentColor: Colors.pinkAccent,
            highlightColor: Colors.blueAccent,
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline2: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800]),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              headline4: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              bodyText1: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ),
        );
      });
    });
  }
}
