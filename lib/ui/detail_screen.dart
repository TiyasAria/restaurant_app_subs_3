import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/data/api/api_service.dart';
import 'package:reaturant_app/provider/detail_provider.dart';
import 'package:reaturant_app/widget/detail_restaurant.dart';


class DetailScreen extends StatelessWidget {
  static const routeName = '/detailScreen';

  final String id;

  const DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: ( context,  value,  child) {
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
            ChangeNotifierProvider<DetailRestaurantProvider>(
              create: (context) =>
                  DetailRestaurantProvider(apiService: ApiService(), id: id),
              child: const Scaffold(
                body: SafeArea(
                    child: DetailRestaurant()
                ),
              )
            )
          ],
        );
      },
      child: Container(),
    );
  }
}
