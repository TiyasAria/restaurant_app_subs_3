import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:reaturant_app/data/model/detail_model.dart';
import 'package:reaturant_app/data/model/search_model.dart';

import '../model/model.dart';

class ApiService {
  String _baseurl = 'https://restaurant-api.dicoding.dev/';

//   make funct future for fetchData
  Future<RestaurantResult> fetchRestaurant() async {
  // make a response
    final response = await http.get(Uri.parse(_baseurl + 'list'));

    if (response.statusCode == 200){
      return RestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("'Error can't get data");
    }
  }

  // make func for detail
  Future<RestaurantDetail> fetchDetailRestaurant(String  id) async {
    final response = await http.get(
        Uri.parse(_baseurl + 'detail/${id}'));

    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Can't get detail data");
    }
  }


  // make it for search
  Future<RestaurantSearch> getSearchResult(String query) async {
    final response = await http.get(
        Uri.parse(_baseurl + 'search?q=' + query));

    if (response.statusCode == 200) {
      return RestaurantSearch.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Type your favorite menu or restaurant');
    }
  }
}