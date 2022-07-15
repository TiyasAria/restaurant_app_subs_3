import 'package:flutter/foundation.dart';
import 'package:reaturant_app/data/db/database_helper.dart';
import 'package:reaturant_app/data/model/enum_state.dart';

import '../data/model/model.dart';


class FavoriteProvider extends ChangeNotifier {
  late  DatabaseHelper databaseHelper;

  FavoriteProvider({required this.databaseHelper}) {
    _getFavorite() ;
  }

  late ResultState _state;

  ResultState get state => _state;

  String _message = " ";

  String get message => _message;

  List<Restaurant>? _favorite = [];

  List<Restaurant>? get favorite => _favorite;

//   buatlaah func untuk mendapatkan data dari database
  void _getFavorite() async {
    _favorite = await databaseHelper.getRestaurant();
    if (_favorite!.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'No data';
    }
    notifyListeners() ;
  }

//  method untuk menambahkan bookmark
 void addFavorite(Restaurant restaurant)  async{
     try {
       await databaseHelper.insertFavorite(restaurant);
       _getFavorite();
     } catch (e) {
      _state = ResultState.error ;
      _message = 'Error => $e' ;
      notifyListeners();
     }
 }

//  func untuk menandai apakh dia favorite atau tdk

Future<bool> isFavorite(String id) async {
    final favoriteRestaurant = await databaseHelper.getRestaurantById(id);
    return favoriteRestaurant.isNotEmpty ;
}

void removeFavorite(String id) async {
    try{
      await databaseHelper.deleteRestaurant(id);
      _getFavorite();
    } catch (e){
      _state = ResultState.error ;
      _message = 'error -> $e' ;
      notifyListeners() ;
    }
}

}