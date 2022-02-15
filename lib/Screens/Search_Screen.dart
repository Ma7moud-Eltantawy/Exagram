import 'package:exagram/References/Refrences.dart';
import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/widgets/posts_Listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'My_posts.dart';
class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height/33,),
          Expanded(
              flex: 1,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded)),
              Padding(
                padding: EdgeInsets.only(right: width/3),
                child: RichText(
                  text: TextSpan(
                    children: [

                      WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal:width/10),
                            child: Icon(Icons.search, size: 14)),
                      ),
                      TextSpan(
                        text: " Search ",
                          style: TextStyle(
                              color: Colors.black,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily,
                            fontWeight: FontWeight.w100
                          )

                      ),
                    ],
                  ),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner)),
            ],
          )),
          Expanded(
            flex: 1,
            child: Container(
              height: height/10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.all(width/90),
                      margin: EdgeInsets.symmetric(horizontal: width/35,vertical: height/80),
                      height: height/10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5)
                      ),
                     
                      child: Center(child: Text(Search_category[index])),

                    );
              },
                itemCount: Search_category.length,
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: Posts_Gridview()),
        ],
      ),
    );
  }
}
