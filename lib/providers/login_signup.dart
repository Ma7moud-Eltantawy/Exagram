import 'package:flutter/cupertino.dart';

class Signinup_prov with ChangeNotifier{
  bool nav=true;
  String username="mahmoud_eltantawy22";
  String userimg="assets/img/mahmoud.jpg";
  void changenav()
  {
    nav=!nav;
    notifyListeners();
  }

  bool visable=false;
  void change_visibilty()
  {
   visable=!visable;
   notifyListeners();
  }
}