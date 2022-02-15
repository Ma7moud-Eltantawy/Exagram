import 'package:exagram/providers/Posts_prov.dart';
import 'package:exagram/providers/login_signup.dart';
import 'package:exagram/widgets/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

  final StoryController controller = StoryController();

class Story_viewer extends StatefulWidget {
  static const scid="Story_viewer";
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<Story_viewer> {
  final storyController = StoryController();
  TextEditingController ctrl=TextEditingController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    var pr=Provider.of<Posts_prov>(context);
    return MaterialApp(
      home: Scaffold(
        body:Stack(
          children: [

              Hero(
                tag: 'pic${pr.tagdat}',
                child: StoryView(

                storyItems: [


                 StoryItem.inlineImage(
                    url:
                    "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                    "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                    controller: controller,
                    caption: Text(
                      "Hektas, sektas and skatad",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.text(
                    title: "I guess you'd love to see more of our food. That's great.",
                    backgroundColor: Colors.blue,
                  ),
                  StoryItem.text(
                    title: "Nice!\n\nTap to continue.",
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(
                      fontFamily: 'Dancing',
                      fontSize: 40,
                    ),
                  ),
                  StoryItem.pageImage(
                    url:
                    "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                    caption: "Still sampling",
                    controller: storyController,
                  ),
                  StoryItem.pageImage(
                      url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                      caption: "Working with gifs",
                      controller: storyController),
                  StoryItem.pageImage(
                    url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                    caption: "Hello, from the other side",
                    controller: storyController,
                  ),
                  StoryItem.pageImage(
                    url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                    caption: "Hello, from the other side2",
                    controller: storyController,
                  ),


                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                  Navigator.of(context).pop();

                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                controller: storyController,
          ),
              ),

            Positioned(
                top: height/12,
                left: width/20,
                child: Row(
                  children: [
                    CircleAvatar(
                     backgroundImage: AssetImage("assets/img/mahmoud.jpg"),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 10),
                        child: Text("mahmoud_eltantawy22",style: TextStyle(
                          color: Colors.white
                        ),),),
                  ],
                )),

          ],
        ),

      ),
    );
  }
}