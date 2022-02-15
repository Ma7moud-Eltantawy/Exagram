import 'package:exagram/Models/Models.dart';
import 'package:flutter/cupertino.dart';

class Settings_prov with ChangeNotifier{
  // ignore: non_constant_identifier_names
  List<dynamic> data_Search=[];

  void ChangeData_Search(String data)
  {
    data_Search=Drawr_items_List.where((element) => element.name!.contains(data)).toList();
    //data_Search=Drawr_items_List.where((element) => element.name!.contains(data)).toList();
    notifyListeners();
  }
}