import 'package:flutter/foundation.dart';
import 'package:reaturant_app/data/api/api_service.dart';
import 'package:reaturant_app/data/model/detail_model.dart';

import '../data/model/enum_state.dart';

class DetailRestaurantProvider with ChangeNotifier {
  final ApiService apiService;

  final String id;

  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _getDetailRestaurant(id);
  }

  // remember use late for inisialisai var yang belum ada datanya dan tidak tetap
  late RestaurantDetail _restaurantDetail;
  late ResultState _resultState;
  String _message = '';

//  make getter supaya bisa di acces di kelas lain
  RestaurantDetail get restaurantDetail => _restaurantDetail;

  ResultState get state => _resultState;

  String get message => _message;

//   make a func future

  Future<dynamic> _getDetailRestaurant(String id) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      //     make a var to acces data from api service
      final detailRestaurant = await apiService.fetchDetailRestaurant(id);
      if (detailRestaurant.error) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = "No data in Detail";
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _restaurantDetail = detailRestaurant;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      print(e);
      return _message = 'Not connected to the internet...';
    }
  }
}
