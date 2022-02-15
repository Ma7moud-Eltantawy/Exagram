import 'package:exagram/Models/videos_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';
import 'package:video_player/video_player.dart';
class Vid_Screen extends StatefulWidget {
  const Vid_Screen({Key? key}) : super(key: key);

  @override
  _Vid_ScreenState createState() => _Vid_ScreenState();
}

class _Vid_ScreenState extends State<Vid_Screen> {
  VideoPlayerController?_controller;
  void initState() {
    super.initState();

    Provider.of<vid_Api>(context,listen: false).getVideos();
    _controller = VideoPlayerController.network(
        ' https://player.vimeo.com/external/365833692.hd.mp4?s=90bf769cc48119c9eb9ee9e431322c131a2525d3&profile_id=174&oauth2_token_id=57447761')
      ..initialize().then((_) {
        _controller!.play();

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;


    return Scaffold(
      body:Stack(
        children: [

          FutureBuilder(
              future: Provider.of<vid_Api>(context,listen: false).getVideos(),
              builder:(context,snapshot)=>PageView.builder(
                scrollDirection:Axis.vertical ,
                onPageChanged: (index){
                  print( Provider.of<vid_Api>(context,listen: false).data.length);
                  print( Provider.of<vid_Api>(context,listen: false).data[index]['video_files'][0]['link'].toString());
                  setState(() {
                    _controller = VideoPlayerController.network(
                        Provider.of<vid_Api>(context,listen: false).data[index]['video_files'][0]['link'].toString()
                    )
                      ..initialize().then((_) {
                        _controller!.play();

                        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                        setState(() {});
                      });
                  });

                },
                itemBuilder:(context,index)=>
                    Stack(
                      children: <Widget>[
                        SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: _controller!.value.size.width  ,
                              height: _controller!.value.size.height ,
                              child: VideoPlayer(_controller!),
                            ),
                          ),
                        ),
                        //FURTHER IMPLEMENTATION
                      ],
                    ),
                itemCount: Provider.of<vid_Api>(context,listen: false).data.length,
              )

          ),
          Positioned(
              bottom: height/10,
              right: width/30,
              child: Column(
            children: [
             Stack(
               children: [
                 Center(
                   child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     shape: BoxShape.circle,
                   ),
                   height: height/12,
                   width: width/9,
                   child: Center(child: Container(
                     decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage("assets/img/mahmoud.jpg"),

                       ),
                       shape: BoxShape.circle,
                     ),
                     height: height/20,
                     width: width/10,
                   )),
               ),
                 ),
                 Positioned(
                   bottom: height/12/12,
                     right: width/20/2,
                     child:Container(
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.pink
                       ),
                       child: Center(child: Icon(Icons.add,size: 15,color: Colors.white,)),
                       height: height/40,
                       width: width/20,
                     )
                 ),

               ],
             ),
              IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border,color: Colors.white,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.comment,color:Colors.white)),
              IconButton(onPressed: (){}, icon: Icon(Feather.share_2,color:Colors.white)),

            ],
          )),
        ],
      ),
    );
  }
}
