import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exagram/References/Refrences.dart';
import 'package:exagram/Screens/Chat_Screen.dart';
import 'package:exagram/Screens/Login_Screen.dart';
import 'package:exagram/Screens/My_posts.dart';
import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:exagram/providers/User_Data.dart';
import 'package:exagram/widgets/Story.dart';
import 'package:exagram/widgets/Home_Posts_view.dart';
import 'package:exagram/widgets/Story_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  _Main_ScreenState createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  late List<DocumentSnapshot> Snapshotlist;
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("posts");
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
  Widget build(BuildContext context) {

    var pr=Provider.of<Theme_prov>(context);
    int i=Snapshotlist.length;
    var pro=Provider.of<Posts_prov>(context);
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return MaterialApp(
      themeMode: pr.thmood,
      theme: pr.thdata,
      home: Scaffold(
        appBar:   AppBar(
          leading:IconButton(
            icon: Icon(  Feather.camera),
            onPressed: (){},
          ),
          title:   Text("ExaGram",style: TextStyle(
              fontFamily: GoogleFonts.pacifico().fontFamily,
              fontSize: 30,
              fontWeight: FontWeight.w100
          ),
          textAlign: TextAlign.left,),

          actions: [
            IconButton(onPressed: ()async{

            }, icon:Icon( Icons.add_box_outlined)),
            IconButton(onPressed: ()async{
              await upload("c");





            }, icon:Icon(  Feather.heart)),
            IconButton(onPressed: (){
              Provider.of<User_Data_Prov>(context,listen: false).getcurrentuser();


              Navigator.of(context).pushNamed(Chat_Screen.scid);
            }, icon:Icon( Feather.send)),

          ],
        ),
        body: ListView(
          children:[Column(
            children: [

              Container(
                width: width,
                height: height/9,

                child:Consumer<Posts_prov>(
                    builder:(ctx,prov,ch)=> ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index)=> GestureDetector(onTap:(){
                        pro.changetagdata(index);
                        Navigator.of(context).pushNamed(Story_viewer.scid);

                        // Navigator.replace(context, oldRoute: MaterialPageRoute(builder: (context)=> Main_Screen()), newRoute: MaterialPageRoute(builder: (context)=> Login_Screen()));
                      },child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width/120),
                        height: height/65,
                        width: width/4.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.pink,
                            ]
                          ),
                          shape:BoxShape.circle,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: width/120),
                          child: Hero(
                            tag: "pic$index",
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: width/120),

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(prov.Posts_List[index].img.toString()),
                                  fit: BoxFit.cover
                                ),
                                shape:BoxShape.circle,
                              ),
                            ),
                          )  ,

                          height: height/60,
                          width: width/4.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape:BoxShape.circle,
                          ),
                        ),
                      ),),

                      itemCount: Provider.of<Posts_prov>(context,listen: false).Posts_List.length,
                    )
                )
              ),


              Expanded(
                child: Container(
                  width: width,
                  height:i<3?height*2: height*i/1.7,
                  child: Posts(),
                ),
              ),

            ],
          ),]
        ),
      ),
    );
  }
}
