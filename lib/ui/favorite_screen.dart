import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/data/model/enum_state.dart';
import 'package:reaturant_app/provider/favorite_provider.dart';
import 'package:reaturant_app/widget/list_restaurant.dart';

import '../common/theme.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static const routeName = '/favScreen' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Favorite Restaurant', style: commonText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 28),
                ) ,
                const SizedBox(height: 10,),
                Flexible(
                  child: Consumer<FavoriteProvider>(
                      builder: (context , data , _){
                        if (data.state == ResultState.hasData){
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.favorite?.length,
                              itemBuilder: (context , index){
                                  return Dismissible(
                                      key: Key(data.favorite![index].id.toString()),
                                  background: Container(color: Colors.red,),
                                  onDismissed: (direction){
                                        data.removeFavorite(data.favorite![index].id);
                                  },
                                  child: buildRestaurantItem(context, data.favorite![index]));
                              }
                          );
                        } else if (data.state == ResultState.error){
                          return Center(
                            child:  Text(data.message),
                          );
                        } else if (data.state == ResultState.noData){
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.hourglass_empty, size: 50),
                                const SizedBox(height: 10,),
                                Text(data.message)
                              ],
                            ),
                          );
                        } else if  (data.state == ResultState.loading){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        }else {
                          return const Center(
                            child: Text(''),
                          ) ;
                        }
                      }
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
