import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exagram/Models/Models.dart';
import 'package:exagram/Screens/Login_Screen.dart';
import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _Pageview_screenState createState() => _Pageview_screenState();
}

class _Pageview_screenState extends State<Posts> {

  @override
  void initState() {

    super.initState();
  }
  @override
  final sc=PageController(initialPage: 0,viewportFraction: 1);


  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<Posts_prov>(context);
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("posts").snapshots(),
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
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      controller: sc,
    reverse: true,
    scrollDirection: Axis.vertical,

    children: snapshot.data!.docs.map((document) {
    return Container(
    child: Column(
    children: [
    Expanded(
    flex: 2,
    child: Container(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Row(
    children: [
    Padding(
    padding: EdgeInsets.symmetric(horizontal: width/30),
    child: CircleAvatar(
    backgroundImage: AssetImage(prov.Posts_List[1].userimg.toString()),
    ),
    ),
    Text(prov.Posts_List[1].username.toString()),

    ],
    ),
    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))


    ],
    ),

    color: Provider.of<Theme_prov>(context).thdata.appBarTheme.backgroundColor,
    width: double.infinity,
    ),

    ),
    Expanded(
    flex: 9,
    child: GestureDetector(
    onTap:(){
    PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Login_Screen();
    });
    },
    child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage(document['url']),
    fit: BoxFit.contain
    )
    ),

    width: double.infinity,
    ),
    )),
    Expanded(
    flex: 3,
    child: Container(

    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Padding(
    padding:EdgeInsets.symmetric(horizontal: width/30) ,
    child: Row(
    children: [
    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
    IconButton(onPressed: (){}, icon: Icon(Icons.question_answer_outlined)),
    IconButton(onPressed: (){}, icon: Icon(Icons.near_me_outlined)),
    ],
    ),
    ),
    IconButton(onPressed: (){}, icon: Icon(Icons.turned_in_not))

    ],
    ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: width/20),
    child: Text(prov.Posts_List[1].time.toString())),

    ],),

    color: Provider.of<Theme_prov>(context).thdata.appBarTheme.backgroundColor,
    width: double.infinity,
    )),
    Divider(
    color: Colors.red,
    height: height/700,
    ),

    ],
    ),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage(document['url']),
    fit: BoxFit.cover
    )
    ),
    height: height/1.7,


    );

    }).toList(),
    ),
    ),
    ],
    );


    },
    );
  }
}
