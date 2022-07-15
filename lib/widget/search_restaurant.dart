import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/provider/search_provider.dart';
import 'package:reaturant_app/widget/list_restaurant.dart';

import '../data/model/enum_state.dart';

class RestaurantSearch extends StatelessWidget {
  const RestaurantSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
        builder: (context, data, _){
          if(data.state == ResultState.loading){
            return Column(
              children: const [
                Center(child: CircularProgressIndicator(),),
                Text('Search Data')
              ],
            );
          } else if (data.state == ResultState.hasData){
            return ListView.builder(
              itemCount: data.searchResto.restaurants.length,
                itemBuilder: (context, index){
                  var restaurantSearch = data.searchResto.restaurants[index];
                  return buildRestaurantItem(context, restaurantSearch);
                }
            );
          } else if (data.state == ResultState.noData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Icon(Icons.search_off_rounded , size: 70,)),
                Text(data.message)
              ],
            );
          } else if (data.state == ResultState.error){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Icon(Icons.youtube_searched_for_rounded , size: 70,)),
                Text(data.message)
              ],
            );
          } else {
            return Text('');
          }
        }
    );
  }
}
