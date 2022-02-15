import 'package:exagram/Models/Models.dart';
import 'package:exagram/providers/Settings_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Setting_Screen extends StatefulWidget {
  static const scid="Settings_Screen";
  String title;
  Setting_Screen({Key? key,required this.title}) : super(key: key);

  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  @override
  Widget build(BuildContext context) {
    var pr=Provider.of<Settings_prov>(context,listen: false);
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(child: TextField(
              onChanged: ( data){
              Provider.of<Settings_prov>(context,listen: false).ChangeData_Search(data);
              },
              cursorColor: Colors.black26,
              decoration: InputDecoration(
               labelText: "Search",
               prefixIcon:Icon(Icons.search,color: Colors.black,) ,
                fillColor: Colors.black26,
                focusColor: Colors.black26,
                hoverColor: Colors.black26,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.black54, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black12, width: 2.0),
                ),

              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
            ),
            Consumer<Settings_prov>(

              builder:(context,pro,ch)=> ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: pr.data_Search.length==0?Drawr_items_List.length:pr.data_Search.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                    padding: EdgeInsets.all(2),
                    child: GestureDetector(
                        onTap: () {
                          if(Drawr_items_List[i].navwidget.toString()!="" || pr.data_Search[i].navwidget.toString()!=""){
                          pr.data_Search.length==0?Navigator.of(context).pushNamed(Drawr_items_List[i].navwidget.toString()):Navigator.of(context).pushNamed(pr.data_Search[i].navwidget.toString());
                          }
                        },
                        child: Container(
                          child: Row(
                            children: [
                              pr.data_Search.length==0?Image.asset(  Drawr_items_List[i].imageicon.toString(),height: height/25,width: width/8,):Image.asset(  pr.data_Search[i].imageicon.toString(),height: height/25,width: width/8,),
                              SizedBox(width: 10,),
                              pr.data_Search.length==0?Text(  Drawr_items_List[i].name.toString()):Text(  pr.data_Search[i].name.toString()),
                            ],
                          ),
                          height: 50,
                        )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
