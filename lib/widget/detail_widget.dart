import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/utils/convert_data.dart';
import 'package:reaturant_app/data/model/detail_model.dart';
import 'package:reaturant_app/provider/favorite_provider.dart';

import '../common/theme.dart';
import 'detail_value.dart';
import 'place_rating.dart';

class DetailWidget extends StatelessWidget {
  final RestaurantDetailItem resto;

  const DetailWidget({super.key, required this.resto});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<FavoriteProvider>(
        builder: (context, value, child) {
          return FutureBuilder<bool>(
            future: value.isFavorite(resto.id),
            builder: (context, snapshot) {
              var isFav = snapshot.data ?? false;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(
                        "https://restaurant-api.dicoding.dev/images/large/${resto.pictureId}",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 10,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  //color of shadow
                                  spreadRadius: 5,
                                  //spread radius
                                  blurRadius: 7,
                                  // blur radius
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: isFav
                                ? IconButton(
                                onPressed: () {
                                 return  value.removeFavorite(resto.id);
                                },
                                icon: Icon(Icons.favorite , color: Colors.red,))
                                : IconButton(
                                onPressed: () {
                                  return value.addFavorite(toConvertRestaurantDetailItemToRestaurant(resto));
                                },
                                icon: Icon(Icons.favorite_border_rounded, color: Colors.red))),
                      ),

                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      resto.name,
                      style: titleDetail,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPlace(context, '${resto.city} + ${resto.address}'),
                      buildRating(context, resto.rating.toString())
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Text(
                        resto.description,
                        style: commonText,
                      )),
                  buildTitleMenu('Food Lists'),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: resto.menus.foods
                                .map((drink) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.3),
                                              blurRadius: 7,
                                              offset: Offset(0, 5))
                                        ],
                                        color: Colors.white,
                                      ),
                                      width: 100,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              'https://th.bing.com/th/id/R.258060bfd7f932be9826c915642072bd?rik=W0w7H12WpOHoKw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_415179.png&ehk=4XkVpw92NOiqdfpXTKzd31%2biModbKXc1LOc4BmDKX60%3d&risl=&pid=ImgRaw&r=0',
                                              width: 50,
                                              height: 50,
                                            ),
                                            Text(
                                              resto.name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: commonText.copyWith(
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildTitleMenu('Drink Lists'),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: resto.menus.drinks
                                .map((drink) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.3),
                                              blurRadius: 7,
                                              offset: Offset(0, 5))
                                        ],
                                        color: Colors.white,
                                      ),
                                      width: 100,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              'https://th.bing.com/th/id/R.3d1e0a329bc199a0a0bed1621ae638a2?rik=HUFP%2brMkUceK%2fg&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_479691.png&ehk=XaLRHGnf%2b5porC2jimYzVr1JN1g5PZ%2bkxO3JKnrthQE%3d&risl=&pid=ImgRaw&r=0',
                                              width: 50,
                                              height: 50,
                                            ),
                                            Text(
                                              resto.name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: commonText.copyWith(
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildTitleMenu('Review Lists'),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: resto.customerReviews.length,
                        itemBuilder: (context, index) {
                          return buildReview(resto.customerReviews[index]);
                        }),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
