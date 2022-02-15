// ignore: file_names
import 'package:exagram/Screens/Home_Screen.dart';
import 'package:exagram/Screens/Signup_Screen.dart';
import 'package:exagram/widgets/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login_Screen extends StatefulWidget {
  static const scid="Login_Screen";
  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  _Saveuser(String user) async{
    SharedPreferences usersp=await SharedPreferences.getInstance();
    usersp.setString("username", user);
    print(usersp.get("username"));

  }

  @override
  Widget build(BuildContext context) {
    final _formkey=GlobalKey<FormState>();
    TextEditingController user=new TextEditingController();
    TextEditingController pass=new TextEditingController();

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
                      textfield(icon: Icons.person,title: "user name",secure:false,controller: user,valtext: "user",),
                      textfield(icon: Icons.person,title: "Password",secure:false,controller: pass,valtext: "pass",),

                      ElevatedButton(onPressed: () async{
                        if(user!=null){
                          try {

                           var Result= await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.text, password: pass.text);
                           User? username=FirebaseAuth.instance.currentUser;
                           String? useremail=username!.email;
                          print(useremail);
                          _Saveuser(useremail!);
                           Navigator.pushNamed(context, Home_Screen.scid);

                            pass.clear();

                          }
                          catch(e) {
                            pass.clear();
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "LOOK OUT !",
                              desc: "This account is not found..",
                              buttons: [
                                DialogButton(

                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pushNamed(Signup_Screen.scid);
                                  },
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "try again",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(116, 116, 191, 1.0),
                                    Color.fromRGBO(52, 138, 199, 1.0)
                                  ]),
                                )
                              ],
                            ).show();
                          }
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height/30),
                        child: Center(
                          child:Text("OR",style: TextStyle(
                              fontFamily: GoogleFonts.aBeeZee().fontFamily,
                              fontSize: 22,
                              color: Colors.black38,
                              fontWeight: FontWeight.w900
                          ),),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/img/facebook.png",height: height/25,),
                  Text(" Login with Facebook",style: TextStyle(
                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    fontSize: 18,
                    color: Color.fromRGBO(7, 37, 138, .9),
                    fontWeight: FontWeight.w900
                ),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(6)),
                      Text(" Forget Password ?",style: TextStyle(
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          fontSize: 14,
                          color: Color.fromRGBO(7, 37, 138, .9),
                          fontWeight: FontWeight.w200
                      ),),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: height/120,horizontal: width/30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38,width: .5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width,
                  height: height/1.7,

                ),

                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(Signup_Screen.scid);
                          },
                          child: Text(" Sign up",style: TextStyle(
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
