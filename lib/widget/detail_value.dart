import 'package:flutter/material.dart';
import 'package:reaturant_app/data/model/detail_model.dart';

import '../common/theme.dart';

Widget buildTitleMenu(String title) {
  return Padding(
    padding: EdgeInsets.only(top: 5),
    child: Text(
      title,
      style: titleList,
    ),
  );
}





Widget buildReview(CustomerReview customerReview) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.VGDXFXnQ8z67v7X5wJ1VugHaFO?pid=ImgDet&rs=1",
                width: 50,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(customerReview.name, style: titleList),
              Text(customerReview.date,
                  style: commonText.copyWith(fontSize: 8)),
              const SizedBox(height: 4),
              Text(
                customerReview.review,
                style: commonText,
                maxLines: 2,
              )
            ],
          )
        ],
      ),
    ),
  );
}
