
import 'dart:convert';

import 'package:http/http.dart' as http ;

import '../model/model.dart';


  String _baseurl = 'https://restaurant-api.dicoding.dev/';

//   make funct future for fetchData
  Future<RestaurantResult> fetchRestaurant( http.Client client) async {
    // make a response
    final response = await client.get(Uri.parse(_baseurl + 'list'));

    if (response.statusCode == 200){
      return RestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("'Error can't get data");
    }
  }


