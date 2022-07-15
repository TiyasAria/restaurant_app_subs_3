import 'package:flutter/foundation.dart';
import 'package:reaturant_app/data/api/api_service.dart';
import 'package:reaturant_app/data/model/model.dart';

import '../data/model/enum_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchRestaurant();
  }

  late RestaurantResult _restaurantResult;

  late ResultState _state;

  String _message = '';

  RestaurantResult get restaurantResult => _restaurantResult;

  ResultState get state => _state;

  String get message => _message;

  Future<dynamic> _fetchRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.fetchRestaurant();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Not connected to the internet...';
    }
  }
}
