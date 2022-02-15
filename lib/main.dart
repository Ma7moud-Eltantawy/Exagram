import 'package:exagram/Screens/Chat_Screen.dart';
import 'package:exagram/Screens/Chat_msg_Screen.dart';
import 'package:exagram/Screens/Home_Screen.dart';
import 'package:exagram/Screens/Login_Screen.dart';
import 'package:exagram/Screens/Main_Page.dart';
import 'package:exagram/Screens/My_posts.dart';
import 'package:exagram/Screens/Signup_Screen.dart';
import 'package:exagram/Screens/Splash_Screen.dart';
import 'package:exagram/Screens/profile_Screen.dart';
import 'package:exagram/Sub_Screens/Settings_Screen.dart';
import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/providers/Settings_prov.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:exagram/providers/User_Data.dart';
import 'package:exagram/providers/login_signup.dart';
import 'package:exagram/widgets/Story_viewer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Models/videos_data.dart';
import 'Sub_Screens/Theme_Screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     const MyApp()

  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value:Signinup_prov() ),
        ChangeNotifierProvider.value(value:Theme_prov() ),
        ChangeNotifierProvider.value(value:Settings_prov() ),
        ChangeNotifierProvider.value(value:Posts_prov() ),
        ChangeNotifierProvider.value(value:User_Data_Prov() ),
        ChangeNotifierProvider.value(value:vid_Api() ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Splash_Screen.scid,
        routes: {

          Splash_Screen.scid:(context)=> Splash_Screen(),
          Login_Screen.scid:(context)=> Login_Screen(),
          Signup_Screen.scid:(context)=> Signup_Screen(),
          Home_Screen.scid:(context)=>Home_Screen(),
         Profile_Screen.scid:(context)=>Profile_Screen(),
          Setting_Screen.scid:(context)=>Setting_Screen(title: "Settings"),
         Theme_Screen.scid:(context)=>Theme_Screen(),
          Theme_Screen.scid:(context)=>Theme_Screen(),
         Story_viewer.scid:(context)=>Story_viewer(),
          Chat_Screen.scid:(context)=>Chat_Screen(),
          Msg_Chat_Screen.scid:(context)=>Msg_Chat_Screen(),



        },
      ),
    );
  }
}

