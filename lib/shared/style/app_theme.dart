


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:medixify/shared/style/colors.dart';

final lightTheme=ThemeData(
  primaryColor: YankeesBlue,
  primarySwatch: buildMaterialColor(SilverChalice),

  appBarTheme: AppBarTheme(
      color: Colors.white,


      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white
      ),


      foregroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: SilverChalice,
      ),

      backwardsCompatibility: false,



  ),
  scaffoldBackgroundColor: Colors.white,



);
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}