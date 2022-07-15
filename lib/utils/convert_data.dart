import 'package:reaturant_app/data/model/detail_model.dart';
import 'package:reaturant_app/data/model/model.dart';

Restaurant toConvertRestaurantDetailItemToRestaurant(RestaurantDetailItem restaurantDetailItem){
   return Restaurant(
       id: restaurantDetailItem.id,
       name: restaurantDetailItem.name,
       description: restaurantDetailItem.description,
       pictureId: restaurantDetailItem.pictureId,
       city: restaurantDetailItem.city,
       rating: restaurantDetailItem.rating) ;

}