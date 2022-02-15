import 'package:exagram/Screens/Home_Screen.dart';
import 'package:exagram/Screens/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
class Splash_Screen extends StatefulWidget {
  static const scid="splash";
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  String disuser="";
  Sharedpref()
  async {
    SharedPreferences usersp=await SharedPreferences.getInstance();
    disuser=usersp.getString('username')!;
    print(disuser);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Sharedpref();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    return SplashScreenView(
      navigateRoute:disuser==""?Login_Screen():Home_Screen(),
      duration: 5000,
      imageSize: (width*0.25).toInt(),
      imageSrc: "assets/img/appicon.png",
      backgroundColor: Colors.white,
      text: "Exagram",
      textStyle:TextStyle(
        fontFamily: GoogleFonts.pacifico().fontFamily,
        fontSize:30,
        fontWeight: FontWeight.bold
      ) ,

    );
  }
}
