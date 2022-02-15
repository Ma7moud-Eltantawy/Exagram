import 'package:exagram/Screens/Home_Screen.dart';
import 'package:exagram/Screens/Login_Screen.dart';
import 'package:exagram/Screens/Main_Page.dart';
import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Story_component extends StatefulWidget {
  const Story_component({Key? key}) : super(key: key);
  static const scid="story_component";

  @override
  _Story_componentState createState() => _Story_componentState();
}

class _Story_componentState extends State<Story_component> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
    body: Consumer<Posts_prov>(
    builder:(ctx,prov,ch)=> ListView.builder(
      scrollDirection: Axis.horizontal,
    itemBuilder: (ctx,index)=> MaterialButton(onPressed:(){
      Navigator.of(context).pushNamed(Login_Screen.scid);
       MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(

          ),
          home: Login_Screen ()
      );
     // Navigator.replace(context, oldRoute: MaterialPageRoute(builder: (context)=> Main_Screen()), newRoute: MaterialPageRoute(builder: (context)=> Login_Screen()));
    },child: Container(color: index.isEven?Colors.pink:Colors.orange,height: 100,width: 100,)),

    itemCount: Provider.of<Posts_prov>(context,listen: false).Posts_List.length,
    )
    )
    );
  }
}
