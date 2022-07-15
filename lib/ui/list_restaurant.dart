import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:reaturant_app/common/theme.dart';
import 'package:reaturant_app/ui/search_page.dart';
import 'package:reaturant_app/widget/home_restaurant.dart';

class ListRestaurantScreen extends StatelessWidget {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  static String routeName = '/homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connected = value != ConnectivityResult.none;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              height: 28.0,
              left: 0.0,
              right: 0.0,
              child: connected
                  ? Visibility(
                      visible: true,
                      child: Container(),
                    )
                  : Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          "Loss Connection",
                        ),
                      ),
                    ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 10, right: 10, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'asset/profile.jpeg',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Halo Tiyas',
                              style: commonText.copyWith(fontSize: 18),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SearchRestaurantScreen.routeName);
                          },
                          icon: const Icon(
                            Icons.search_outlined,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Restaurant',
                      style: commonText.copyWith(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Recommendation restaurant for you',
                      style: commonText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HomeRestaurant(),
                  ],
                ),
              ),
            )
          ],
        );
      },
      child: Container(),
    )));
  }
}
