import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

List<String> Search_category=[
  "IGTV","Shop","Well-being",
  "Travel","Architecture",
  "Decor","Art","Food",
  "Diy","Music",
  "Sports","Beauty"
];
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
