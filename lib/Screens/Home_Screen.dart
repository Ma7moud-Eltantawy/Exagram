import 'package:exagram/Screens/Main_Page.dart';
import 'package:exagram/Screens/Search_Screen.dart';
import 'package:exagram/Screens/profile_Screen.dart';
import 'package:exagram/providers/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Login_Screen.dart';
import 'Vid_Screen.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);
  static const scid="Home_Screen";

  @override
  _Home_ScreenState createState() => _Home_ScreenState();

}

class _Home_ScreenState extends State<Home_Screen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Main_Screen(),
   Search_Screen(),
    Vid_Screen(),
    Login_Screen(),
    Profile_Screen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool pr=Provider.of<Signinup_prov>(context).nav;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: pr==true?BottomNavigationBar(
        elevation: 9,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 28,),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,size: 28,),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined,size: 28,),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store,size: 28,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/img/mahmoud.jpg"),

            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        onTap: _onItemTapped,

      ):null
    );
  }
}
