import 'package:exagram/Sub_Screens/Settings_Screen.dart';
import 'package:exagram/Sub_Screens/Theme_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class Drawer_models
{
  String ?name;
  IconData? Icon;
 String? navwidget;
  Drawer_models({ this.name,this.Icon,this.navwidget});
}
List<Drawer_models>DrawrList=[
  Drawer_models(name: "Archive",Icon: Icons.history_toggle_off_rounded),
  Drawer_models(name: "Your Activity",Icon: Icons.av_timer),
  Drawer_models(name: "QR Code",Icon: Icons.qr_code_scanner_outlined),
  Drawer_models(name: "Saved",Icon: Icons.turned_in_not),
  Drawer_models(name: "Close friends",Icon: Icons.list),
  Drawer_models(name: "Discover people",Icon: Icons.person_add),
  Drawer_models(name: "Settings",Icon: Icons.settings_outlined,navwidget:Setting_Screen.scid),
];
class Drawer_Items_Models
{
  String ?name;
  String? imageicon;
  String? navwidget;
  Drawer_Items_Models({ this.name,this.imageicon,this.navwidget});
}
List<Drawer_Items_Models>Drawr_items_List=[
  Drawer_Items_Models(name: "Follow and invite friends",imageicon: "assets/img/sn_Account.png"),
  Drawer_Items_Models(name: "Notifications",imageicon: "assets/img/sn_Notification.png"),
  Drawer_Items_Models(name: "Privacy",imageicon: "assets/img/sn_Lock.png"),
  Drawer_Items_Models(name: "Security",imageicon: "assets/img/sn_Verified.png"),
  Drawer_Items_Models(name: "Ads",imageicon: "assets/img/sn_Promotion.png"),
  Drawer_Items_Models(name: "Account",imageicon: "assets/img/sn_Account.png"),
  Drawer_Items_Models(name: "Help",imageicon: "assets/img/sn_Question.png"),
  Drawer_Items_Models(name: "About",imageicon: "assets/img/sn_Info.png"),
  Drawer_Items_Models(name: "theme",imageicon: "assets/img/sn_Paint.png",navwidget: Theme_Screen.scid),

];
class Posts_data
{
  String ?userimg;
  String ?username;
  bool ?Lovetoggele;
  String?img;
  List?lovers;
  String?time;
  Posts_data({this.userimg, this.username,required this.img,this.Lovetoggele,this.time});

}



class Message {
  final String text;
  final DateTime date;

  Message(this.text, this.date);
  Message.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        text = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'date': date.toString(),
    'text': text,
  };
}
class MessageDao {
  final DatabaseReference _messagesRef =
  FirebaseDatabase.instance.reference().child('messages');
  void saveMessage(Message message) {
    _messagesRef.push().set(message.toJson());
  }
  Query getMessageQuery() {
    return _messagesRef;
  }
}







