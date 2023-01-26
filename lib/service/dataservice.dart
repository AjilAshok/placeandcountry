import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machinetest/constant/constant.dart';
import 'package:machinetest/model/placemodel.dart';

class RemoteService {
  Future<List<Place>> fetchPlaces() async {
    final response = await http.get(Uri.parse(Constants.apistring));
    if (response.statusCode == 200) {
      List<dynamic> res = jsonDecode(response.body)['places'];
      List<Place> places = res.map((e) => Place.fromJson(e)).toList();
      return places;
    } else {
      throw Exception('Failed to load places');
    }
  }
}
