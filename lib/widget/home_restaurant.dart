import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/enum_state.dart';
import '../provider/restaurant_provider.dart';
import 'list_restaurant.dart';

class HomeRestaurant extends StatelessWidget {
  const HomeRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<RestaurantProvider>(builder: (context, data, _) {
      if (data.state == ResultState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (data.state == ResultState.hasData) {
        return Container(
          height: 600,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.restaurantResult.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant =
                data.restaurantResult.restaurants[index];
                return buildRestaurantItem(context, restaurant);
              }),
        );
      } else if (data.state == ResultState.noData) {
        return Center(
          child: Text(data.message),
        );
      } else if (data.state == ResultState.error) {
        return Center(
          child: Text(data.message),
        );
      } else {
        return Text('');
      }
    });
  }
}
