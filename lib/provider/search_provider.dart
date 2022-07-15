import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:reaturant_app/data/api/api_service.dart';
import 'package:reaturant_app/data/model/search_model.dart';

import '../data/model/enum_state.dart';

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService}) {
    getRestaurantSearch(query);
  }

  late ResultState _resultState;
  late RestaurantSearch _searchResto;

  String _message = '';
  String _query = '';

//   make a getter for the var

  ResultState get state => _resultState;

  RestaurantSearch get searchResto => _searchResto;

  String get message => _message;

  String get query => _query;

  Future<dynamic> getRestaurantSearch(String query) async {
    try {
      _resultState = ResultState.loading;
      _query = query;
      notifyListeners();
      //   make var for connect in api service
      final searchRes = await apiService.getSearchResult(query);
      if (searchRes.restaurants.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'pencarian data anda tidak ditemukan';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _searchResto = searchRes;
      }
    } on SocketException {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Lost Connection';
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Type your favorite menu or restaurant';
    }
  }
}
