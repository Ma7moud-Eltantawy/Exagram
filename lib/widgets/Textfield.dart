import 'package:exagram/providers/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class textfield extends StatelessWidget {

  IconData icon;
  String title;
  bool secure;
  String valtext;
  TextEditingController controller;

  // ignore: use_key_in_widget_constructors
  textfield({ required this.icon,required this.title,required this.secure,required this.controller,required this.valtext});
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Consumer<Signinup_prov>(
      builder: (context,prov,ch){
        return Container(
          height: height/10,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: TextFormField(
              controller: controller,
              obscureText: valtext=="pass"?  prov.visable:false,
              cursorHeight: 10,
              decoration: InputDecoration(

                labelText: title,
                labelStyle:TextStyle (
                    color: Colors.black26
                ),
                suffixIcon: valtext=="pass"?
                     IconButton(
                      onPressed: (){
                        Provider.of<Signinup_prov>(context,listen: false).change_visibilty();
                      },
                      icon:  Provider.of<Signinup_prov>(context,listen: false).visable==true?Icon(Icons.visibility_off):Icon(Icons.visibility),
                    )
                  :null,
                //suffixIcon: Icon(icon,color: Colors.blue,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 10,
                    color: Colors.blueAccent,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
