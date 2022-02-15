import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Theme_prov with ChangeNotifier
{
  ThemeMode thmood=ThemeMode.light;
  ThemeData thdata=ThemeData(
    fontFamily: GoogleFonts.aBeeZee().fontFamily,
    textTheme: TextTheme(
      headline6: TextStyle(
        color:Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    primarySwatch: Colors.lightBlue,
    primaryColor:  Colors.lightBlue,
    brightness: Brightness.light,
    backgroundColor: Colors.white38,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white
    ),
    appBarTheme: AppBarTheme(
        color: Colors.white
    ),

  );
  bool value=false;
  void changetheme(bool val){
    value=val;
    value==true?thmood=ThemeMode.dark:thmood=ThemeMode.light;
    value==true?setDarkMode():setLightMode();
    notifyListeners();
  }
  void setDarkMode() async {
    thdata = darkTheme;
    notifyListeners();
  }

  void setLightMode() async {
    thdata = lightTheme;
    notifyListeners();
  }





  final darkTheme = ThemeData(
    fontFamily: 'Raleway',
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    fontFamily: GoogleFonts.aBeeZee().fontFamily,
    textTheme: TextTheme(
      headline6: TextStyle(
        color:Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    primarySwatch: Colors.lightBlue,
    primaryColor:  Colors.lightBlue,
    brightness: Brightness.light,
    backgroundColor: Colors.white38,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white
    ),
    appBarTheme: AppBarTheme(
        color: Colors.white
    ),
  );

}