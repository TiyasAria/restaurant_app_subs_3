import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:reaturant_app/common/theme.dart';
import 'package:reaturant_app/widget/search_restaurant.dart';
import 'package:reaturant_app/widget/search_widget.dart';

class SearchRestaurantScreen extends StatelessWidget {
  const SearchRestaurantScreen({Key? key}) : super(key: key);

  static const routeName = '/search';

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
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Find Your Restaurant',
                        style: commonText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Enter everything here...',
                        style: commonText.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SearchWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(child: RestaurantSearch())
                    ],
                  ),
                )
              ],
            );
          },
          child: Container(),
        ),
      ),
    );
  }
}
