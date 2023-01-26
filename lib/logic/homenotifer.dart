import 'package:flutter/widgets.dart';
import 'package:machinetest/model/placemodel.dart';
import 'package:machinetest/service/dataservice.dart';

class Homenotifeir extends ChangeNotifier{
  RemoteService service=RemoteService();
  List<Place>_list=[];
   List<Place> get list=>_list;
   Future<void>getAllList()async{
    final response=await service.fetchPlaces();
    _list=response;
    notifyListeners();
   }

}