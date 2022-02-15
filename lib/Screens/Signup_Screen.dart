// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exagram/widgets/Textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Signup_Screen extends StatefulWidget {
  static const scid="Signup_Screen";
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  _Signup_ScreenState createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  @override
  Widget build(BuildContext context) {
    final _formkey=GlobalKey<FormState>();
    TextEditingController user=new TextEditingController();
    TextEditingController pass=new TextEditingController();
    TextEditingController name=new TextEditingController();
    TextEditingController user_name=new TextEditingController();


    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width/30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("ExaGram",style: TextStyle(
                          fontFamily: GoogleFonts.amita().fontFamily,
                          fontSize: 40,
                          fontWeight: FontWeight.w100
                      ),),

                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/6),
                          child: Text("Signup to see photos and videos from your friends",textAlign: TextAlign.center,style: TextStyle(
                              fontFamily: GoogleFonts.aBeeZee().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ),
                      ElevatedButton(onPressed: (){}, child:Container(
                        height: height/15,
                        width: width,
                        child: Center(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/img/wfacebook.png",height: height/20,),
                              Text(" Login with Facebook",style: TextStyle(
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900
                              ),),
                            ],
                          ),
                        ),
                      ), ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height/60),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height/400,
                              width: width/3,
                              color: Colors.black38,
                            ),
                            Center(
                              child:Text(" OR ",style: TextStyle(
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                  fontSize: 22,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w900
                              ),),
                            ),
                            Container(
                              height: height/400,
                              width: width/3,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                      textfield(icon: Icons.person,title: "phonenumber, OR Email",secure:false,controller: user_name,valtext: "user",),
                      textfield(icon: Icons.person,title: "Full Name",secure:false,controller: name,valtext: "user",),
                      textfield(icon: Icons.person,title: "Username",secure:false,controller: user,valtext: "user",),
                      textfield(icon: Icons.person,title: "Password",secure:false,controller: pass,valtext: "pass",),

                      ElevatedButton(onPressed: ()async{
                        try{
                          var sign=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user_name.text, password: pass.text);
                          await FirebaseFirestore.instance.collection('users').add({
                            "img": "https://www.milleworld.com/wp-content/uploads/2020/01/mosalahmadametussauds.jpg",
                            "name" : "${user.value.text}",
                            "user" :"${user_name.value.text}",
                          });
                          await FirebaseAuth.instance.signInWithEmailAndPassword(email: user_name.text, password: pass.text);
                        }
                        catch(e){

                        }


                      }, child:Container(
                        height: height/15,
                        width: width,
                        child: Center(
                          child: Text("Log in",style: TextStyle(
                              fontFamily: GoogleFonts.aBeeZee().fontFamily,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900
                          ),
                          ),
                        ),
                      ), ),


                      Padding(padding: EdgeInsets.all(height/400)),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/7),
                          child: Text("Signup to see photos and videos from your friends",textAlign: TextAlign.center,style: TextStyle(
                              fontFamily: GoogleFonts.aBeeZee().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: height/120,horizontal: width/30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38,width: .5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width,
                  height: height/1.2,

                ),

                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("have an account?",style: TextStyle(
                            fontFamily: GoogleFonts.aBeeZee().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Text(" Sign in",style: TextStyle(
                              fontFamily: GoogleFonts.aBeeZee().fontFamily,
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w900
                          ),),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: height/150,horizontal: width/30),
                  width: width,
                  height: height/12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38,width: .5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
