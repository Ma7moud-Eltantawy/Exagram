import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exagram/Screens/Chat_msg_Screen.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:exagram/providers/User_Data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'dart:ui' as ui;

import 'Login_Screen.dart';
class Chat_Screen extends StatefulWidget {
  static const scid="Chat_Screen";
  const Chat_Screen({Key? key}) : super(key: key);


  @override
  _Chat_ScreenState createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  List<DocumentSnapshot>? Snapshotlist;
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("users");
  StreamSubscription<QuerySnapshot> ? subscription;

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        Snapshotlist = datasnapshot.docs;
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext ctx) {


    var size=MediaQuery.of(ctx).size;
    var height=size.height;
    var width=size.width;
    return MaterialApp(
      theme: Provider.of<Theme_prov>(ctx,listen: false).thdata,
      themeMode:Provider.of<Theme_prov>(ctx,listen: false).thmood ,
      home: Scaffold(
        appBar: AppBar(
          title:Row(
            children: [
              Text(Provider.of<User_Data_Prov>(ctx,listen: false).Currentuser.toString(),style: TextStyle(
                fontFamily: GoogleFonts.aBeeZee().fontFamily,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),) ,
              IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_sharp)),

            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: (){
              Navigator.of(ctx).pop();
            },
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(ctx).pushNamed(Login_Screen.scid);
            }, icon:Icon(Feather.video)),
            IconButton(onPressed: (){}, icon:Icon(Feather.edit)),

          ],

        ),
        body:Column(
          children: [
            Container(
              height: height/16,
              margin: EdgeInsets.symmetric(horizontal: width/35,vertical: height/35),
              child: TextField(
                onChanged: ( data){
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
                        color: Colors.black38, width: 1.2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black12, width: 1.2),
                  ),

                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width/35,vertical: height/150),
              alignment: Alignment.centerLeft,
              child: Text("Message",style: TextStyle(fontSize:18,fontWeight:FontWeight.w500,fontFamily: GoogleFonts.aBeeZee().fontFamily),),
            ),

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("user").snapshots(),
                builder:(ctx,snapshot)=> snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator()):ListView.builder(itemBuilder: (ctx,index){
                  return Card(
                    child: GestureDetector(
                      onTap: (){


                       Navigator.of(context).pushNamed(Msg_Chat_Screen.scid,arguments: Snapshotlist![index].get('user'));

                      },
                      child: Container(
                        height: height/7,
                        child: ListTile(
                          trailing: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(colors: [
                                Colors.pink,
                               Colors.orangeAccent
                              ]).createShader(bounds);
                            },
                            child: Icon(Feather.video,size: width/13,),
                          ),

                          title: Text(Snapshotlist![index].get('name')),
                          subtitle: Text(
                            "At Article, we’re all about great style. Think sleek modular sofas, anything-but-basic beds, smart sideboards, and more ",style: TextStyle(
                            fontFamily: GoogleFonts.abel().fontFamily
                          ),
                          ),
                          leading: Container(
                            width: width/8,
                            height: height/5,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              shape: BoxShape.circle
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage( Snapshotlist![index].get('img')),
                                ),
                              ],
                            )
                          ),
                        ),
                      ),
                    ),
                  );
                }, itemCount:  Snapshotlist!.length),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
