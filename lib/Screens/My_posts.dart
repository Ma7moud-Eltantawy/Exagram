import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/providers/Theme_Prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class My_Posts extends StatefulWidget {
  static const scid="My_posts";
  int index;
   My_Posts({Key? key,required this.index}) : super(key: key);

  @override
  _My_PostsState createState() => _My_PostsState();
}

class _My_PostsState extends State<My_Posts> {


  final controller=PageController(initialPage:5);

  @override
  void initState() {
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
    final sc=PageController(initialPage: widget.index,viewportFraction: .8);


    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return MaterialApp(
      theme: Provider.of<Theme_prov>(context,listen: false).thdata,
      themeMode: Provider.of<Theme_prov>(context,listen: false).thmood,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: Consumer<Posts_prov>(
          builder:(context,prov,ch)=> ListView.builder(
            scrollDirection: Axis.vertical,
          controller: sc,
          itemBuilder: (context,index){
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
                                      backgroundImage: AssetImage(prov.Posts_List[index].userimg.toString()),
                                    ),
                                  ),
                                  Text(prov.Posts_List[index].username.toString()),

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
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Provider.of<Posts_prov>(context,listen: false).Posts_List[index].img.toString()),
                                  fit: BoxFit.cover
                              )
                          ),

                          width: double.infinity,
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
                                child: Text(prov.Posts_List[index].time.toString())),

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
                      image: AssetImage(Provider.of<Posts_prov>(context,listen: false).Posts_List[index].img.toString()),
                      fit: BoxFit.cover
                  )
              ),
              height: height/1.5,


            );
          },
          itemCount: Provider.of<Posts_prov>(context,listen: false).Posts_List.length,
      ),
        )/*Consumer<Posts_prov>(
          builder:(context,prov,ch)=> PageView.builder(
            controller: controller,
            itemBuilder:(context,i)=> ListView.builder(
                itemBuilder: (context,index)=>Container(
                  height: height/1.5,
                 width: double.infinity,
                 child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                          child: Container(
                            child: Image.asset(prov.Posts_List[index].img.toString()),
                            color: Colors.amber,
                            width: double.infinity,
                      )),
                      Expanded(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:  AssetImage(prov.Posts_List[index].img.toString()),
                                fit: BoxFit.fill
                              )
                            ),


                      )),
                      Expanded(
                          flex: 2,
                          child: Container(
                        color: Colors.lightBlue,
                      )),
                    ],
                  ),
                ),
              itemCount: prov.Posts_List.length,
            ),
          ),
        ),*/
      ),
    );
  }
}
