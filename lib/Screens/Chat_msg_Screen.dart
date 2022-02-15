import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fdb;
import 'package:shared_preferences/shared_preferences.dart';
class Msg_Chat_Screen extends StatefulWidget {
  static const scid="msg_chat";

 const Msg_Chat_Screen({Key? key }) : super(key: key);

  @override
  _Msg_Chat_ScreenState createState() => _Msg_Chat_ScreenState();
}

class _Msg_Chat_ScreenState extends State<Msg_Chat_Screen> {


  String ? disuser;
  Sharedpref()
  async {

    SharedPreferences usersp=await SharedPreferences.getInstance();
    disuser=usersp.getString('username');
  }

  @override
  void initState() {

    super.initState();
    Sharedpref();
  }


  TextEditingController _msg=TextEditingController();
  var Firestore=fdb.FirebaseFirestore.instance;
  var msgval;
  @override
  Widget build(BuildContext context) {
    var senderuser=ModalRoute.of(context)!.settings.arguments as String;
    final med=MediaQuery.of(context).size;
    final height=med.height;
    final width=med.width;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar:null,
      body: StreamBuilder(
        stream: Firestore.collection("chats").doc("mahmoud").collection(senderuser).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
           return Center(
             child: CircularProgressIndicator(),
           );
          }
          if (snapshot.connectionState==ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          return Column(
            children: [
            Expanded(
             flex: 7,
              child: ListView(
              reverse: true,
              scrollDirection: Axis.vertical,

              children: snapshot.data!.docs.map((document) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.grey.withAlpha(5).withOpacity(0.2),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: height/35,horizontal: width/15),
                    height: height/7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:Center(
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: EdgeInsets.all(1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(document['msg']),
                                Text(document['time']),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
          ),
            ),
             Expanded(
               flex: 1,

                child: Row(

                  children: [
                    Container(
                      width: width/1.15,
                      child: TextField(
                        controller: _msg,
                        onChanged: (val){
                          setState(() {
                            msgval=val;
                          });

                        },

                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          labelText: "Search",
                          prefixIcon:Icon(Icons.search,color: Colors.black,) ,
                          fillColor: Colors.black26,
                          focusColor: Colors.black26,
                          hoverColor: Colors.black26,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.black54, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12, width: 2.0),
                          ),

                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: ()async{


                          Firestore.collection("chats").doc("mahmoud").collection(senderuser).add({
                            "sender":"user2",
                            "msg":"$msgval",
                            "time":"${DateTime.now()}"});
                          Firestore.collection("chats").doc(disuser).collection(senderuser).orderBy("time",descending: true);




                        },

                      ),
                    ),

                  ],
                ),
              ),
            ],
          );


        },
      ),
    );
  }
}
