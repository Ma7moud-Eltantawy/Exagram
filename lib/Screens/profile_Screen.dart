import 'package:exagram/Models/Models.dart';
import 'package:exagram/Screens/Login_Screen.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:exagram/widgets/Home_Posts_view.dart';
import 'package:exagram/widgets/posts_Listview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);
  static const scid="profile_Screen";


  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var pr=Provider.of<Theme_prov>(context,listen: false);
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    final List<String> _tabs = <String>['assets/img/sn_myPost.png', 'assets/img/sn_myPostTag.png'];
    return Consumer<Theme_prov>(
      builder:(context,prov,ch)=> MaterialApp(
        theme: prov.thdata,
        themeMode:  prov.thmood,
        home: DefaultTabController(
          length: _tabs.length, // This is the number of tabs.
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Row(
                  children: [
                    Text("mahmoud_eltantwy22",style: TextStyle(
                      fontSize: height/60,
                      color: Colors.black,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    ),),
                    IconButton(onPressed: (){
                      Scaffold.of(context).openEndDrawer();
                    }, icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,)),
                  ],
                ),

                leading: IconButton(icon: Icon(Icons.add,color: Colors.black,),onPressed: (){
                  drawerkey.currentState!.openEndDrawer();

                },),

              ),
              body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        leading: Container(),
                        floating: true,
                        pinned: true,

                        actions: [Container()],
                        expandedHeight: height/2.5,
                        // scroll views.
                        forceElevated: innerBoxIsScrolled,
                        bottom: TabBar(
                          // These are the widgets to put in each tab in the tab bar.
                          tabs: _tabs.map((String name) => Tab(icon: Image.asset(name),height: 35,)).toList(),
                        ),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          child:Padding(
                            padding: EdgeInsets.symmetric(vertical: height/20,horizontal: width/25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(

                                   children: [
                                     Stack(
                                       children: [
                                         CircleAvatar(
                                           backgroundImage:  AssetImage("assets/img/mahmoud.jpg"),
                                           radius: width/9,
                                         ),
                                         Positioned(
                                           bottom: -2,
                                           right: -1,
                                           child: Container(

                                             decoration: BoxDecoration(

                                               border: Border.all(color: Colors.white,width: 1.5),
                                               shape: BoxShape.circle,
                                             ),
                                             child: CircleAvatar(
                                               backgroundColor: prov.thdata.primaryColor,
                                               child: Icon(Icons.add,color: Colors.white,),
                                               radius: width/30,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       width: width/16,
                                     ),
                                    Expanded(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text("100",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize:   height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text("posts",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize:height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("100",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text("Followers",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("100",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text("Following",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),

                                      ],
                                    ))
                                   ],
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 ),

                                Container(

                                  alignment: Alignment.centerLeft,
                                  child: Text("mahmoud_eltantwy22",style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                  ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: height/30),
                                  height: height/17,
                                  width: width,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26,width: 1),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: Text("Edit Profile",style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                      fontWeight: FontWeight.w600
                                    ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ),

                  ];
                },
                body: TabBarView(
                  // These are the contents of the tab views, below the tabs.
                  children: [
                   Posts_Gridview(),
                    Posts_Gridview(),

                  ]
                ),
              ),
              endDrawer: Drawer(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                           child: Text("Mahmoud_Eltantawy2019",style: TextStyle(fontSize:15,fontFamily: GoogleFonts.aBeeZee().fontFamily),)),
                       Divider(
                         height: 2,
                         color: Colors.black38,
                       ),
                       ListView.builder(
                         scrollDirection: Axis.vertical,
                         itemCount: DrawrList.length-1,
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context, i) {
                           return Container(
                             margin: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                             padding: EdgeInsets.all(2),
                             child: GestureDetector(
                               onTap: () {
                               },
                               child: Container(
                                 child: Row(
                                   children: [
                                     Icon(DrawrList[i].Icon),
                                     SizedBox(width: 10,),
                                     Text(DrawrList[i].name.toString()),
                                   ],
                                 ),
                                 height: 50,
                               )
                             ),
                           );
                         },
                       ),
                     ],
                   ),
                    Column(children: [
                      Divider(
                        height: 2,
                        color: Colors.black38,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(DrawrList.last.navwidget.toString());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                            child: Row(
                              children: [
                                Icon(DrawrList.last.Icon),
                                SizedBox(width: 10,),
                                Text(DrawrList.last.name.toString()),
                              ],
                            ),
                            height: 50,
                          )
                      ),
                    ],)
                  ],
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

}