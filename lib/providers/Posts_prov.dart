import 'dart:io';

import 'package:exagram/Models/Models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';
var time=DateTime.now();

class Posts_prov with ChangeNotifier{
  List<Posts_data> Posts_List=[
    Posts_data(Lovetoggele: false,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/mahmoud.jpg",time:DateFormat('d MMM, yyyy').format(time) ),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user3.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: false,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user2.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user4.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/mahmoud.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user1.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: false,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/mahmoud.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user2.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user5.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: false,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user3.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
    Posts_data(Lovetoggele: true,username:"mahmoud_eltantawy22",userimg: "assets/img/mahmoud.jpg",img: "assets/img/user4.jpg",time:DateFormat(' d MMM, yyyy').format(time)),
  ];
  String tagdat="0";
  void changetagdata(int index)
  {
    tagdat=index.toString();
    notifyListeners();

  }
  Future<void> upload(String source) async{
    FirebaseStorage storage = FirebaseStorage.instance;
    final ImagePicker picker=ImagePicker();
    XFile? Pickedimage;
    try{
      Pickedimage=await picker.pickImage(source: source=="camera"?ImageSource.camera:ImageSource.gallery, maxWidth: 1920);
      final String fileName = path.basename(Pickedimage!.path);
      final imagefile=File(Pickedimage.path);
      try{
        var StorageTaskSnapshot =await storage.ref(fileName).putFile(imagefile);
        String url = await StorageTaskSnapshot.ref.getDownloadURL();
        var fstore=FirebaseFirestore.instance;
        fstore.collection("posts").doc().set({
          'url':url,
        });

      }
      catch(e){

      }

    }
    catch(e){}
  }






}