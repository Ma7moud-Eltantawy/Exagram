import 'package:exagram/Models/Models.dart';
import 'package:exagram/Screens/My_posts.dart';
import 'package:exagram/providers/Posts_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class Posts_Gridview extends StatefulWidget {
  const Posts_Gridview({Key? key}) : super(key: key);

  @override
  _Posts_GridviewState createState() => _Posts_GridviewState();
}

class _Posts_GridviewState extends State<Posts_Gridview> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio:  width/height*1.5,
              mainAxisSpacing: height/width*2,
              crossAxisSpacing:  height/width*2,

            ) , itemBuilder: (context,index){
              return AnimationConfiguration.staggeredGrid(
                columnCount: 3,
                position: index,
                duration: const Duration(milliseconds: 700),
                child: FadeInAnimation(

                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>My_Posts(index: index,)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Provider.of<Posts_prov>(context,listen: false).Posts_List[index].img.toString()),
                          fit: BoxFit.cover
                        )
                      ),
                      height: height/2,
                      width: width/2,

                    ),
                  ),
                ),
              );
        },
          itemCount: Provider.of<Posts_prov>(context,listen: false).Posts_List.length,
        ),
      ),
    );
  }
}
