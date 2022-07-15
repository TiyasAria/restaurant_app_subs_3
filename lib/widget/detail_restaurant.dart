import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/widget/detail_widget.dart';

import '../data/model/enum_state.dart';
import '../provider/detail_provider.dart';


class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(
      builder: (context, data, _) {
        if (data.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.state == ResultState.hasData) {
          var resto = data.restaurantDetail.restaurant ;
          return  DetailWidget(resto: resto);
        } else if (data.state == ResultState.error) {
          return Center(
            child: Text(data.message),
          );
        } else if (data.state == ResultState.noData) {
          return Center(
            child: Text(data.message),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
