import 'package:flutter/material.dart';
import 'package:reaturant_app/widget/place_rating.dart';

import '../common/navigation.dart';
import '../data/model/model.dart';
import '../common/theme.dart';
import '../ui/detail_screen.dart';

Widget buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return GestureDetector(
    onTap: () {
      Navigation.withIntentData(DetailScreen.routeName , restaurant.id);
    },
    child: Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Hero(
              tag: Image.network(
                  'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}'),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
                    width: 100,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: titleList,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  buildPlace(context, restaurant.city),
                  const SizedBox(height: 10),
                  buildRating(context, restaurant.rating.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

