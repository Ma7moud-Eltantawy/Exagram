import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Data_Prov with ChangeNotifier
{
  String ?Currentuser;
  String ?Senderuser;
  void getcurrentuser() async
  {
    SharedPreferences usersp=await SharedPreferences.getInstance();
    Currentuser =usersp.getString('username');
    notifyListeners();
  }
  void getSenderuser(sender) async
  {
    Senderuser =sender;
    notifyListeners();
  }

 
}