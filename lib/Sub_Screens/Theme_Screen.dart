import 'package:exagram/providers/Theme_Prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Theme_Screen extends StatefulWidget {
  static const scid='theme_screen';
  const Theme_Screen({Key? key}) : super(key: key);

  @override
  _Theme_ScreenState createState() => _Theme_ScreenState();
}

class _Theme_ScreenState extends State<Theme_Screen> {
  @override
  Widget build(BuildContext context) {
    var pr=Provider.of<Theme_prov>(context,listen: false);
    return MaterialApp(
      themeMode: pr.thmood,
      theme: pr.thdata,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded), onPressed: () { Navigator.pop(context); },
          ),
          title: Text("Set Theme"),
        ),
        body: ListView(
          children: [
            
            SwitchListTile(
                title: Text("dark mode"),
                value:Provider.of<Theme_prov>(context).value ,
                onChanged: (val){
                  Provider.of<Theme_prov>(context,listen: false).changetheme(val);
                })



          ],
        ),
      ),
    );
  }
}
