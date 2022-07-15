import 'package:flutter/material.dart';


import '../common/theme.dart';

buildPlace (BuildContext context, String  restaurant){
  return  Row(
      children: [
        Icon(Icons.location_on_rounded, size: 14,color: Colors.red,),
        SizedBox(width: 8,),
        Text(restaurant,  style: commonText,)
      ]);
}


buildRating (BuildContext context, String restaurant){
  return  Row(
    children: [
      Icon(Icons.star, size: 14,color: Color(0xfff1bb49),),
      SizedBox(width: 8,),
      Text(restaurant , style: commonText,)
    ],
  );
}