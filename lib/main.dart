import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/common/navigation.dart';
import 'package:reaturant_app/data/api/api_service.dart';
import 'package:reaturant_app/data/db/database_helper.dart';
import 'package:reaturant_app/provider/favorite_provider.dart';
import 'package:reaturant_app/provider/restaurant_provider.dart';
import 'package:reaturant_app/provider/scheduling_provider.dart';
import 'package:reaturant_app/provider/search_provider.dart';
import 'package:reaturant_app/ui/detail_screen.dart';
import 'package:reaturant_app/ui/favorite_screen.dart';
import 'package:reaturant_app/ui/home_screen.dart';
import 'package:reaturant_app/ui/list_restaurant.dart';
import 'package:reaturant_app/ui/search_page.dart';
import 'package:reaturant_app/ui/setting_screen.dart';
import 'package:reaturant_app/utils/background_service.dart';
import 'package:reaturant_app/utils/notification_helper.dart';

import 'ui/splashscreen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin() ;

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();

    await AndroidAlarmManager.initialize();

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(create: (_) => RestaurantProvider(apiService: ApiService())),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider(apiService: ApiService())),
        ChangeNotifierProvider<FavoriteProvider>(create: (_) => FavoriteProvider(databaseHelper: DatabaseHelper())),
        ChangeNotifierProvider<SchedulingProvider>(create: (_) => SchedulingProvider())
      ],
      child: MaterialApp(
        title: 'Restaurant App ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        navigatorKey: navigatorKey,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName : (context) => const HomeScreen() ,
          FavoriteScreen.routeName : (context) => const FavoriteScreen() ,
          SettingScreen.routeName : (context) => const SettingScreen() ,
          ListRestaurantScreen.routeName: (context) => const ListRestaurantScreen(),
          SearchRestaurantScreen.routeName: (context) => const SearchRestaurantScreen(),
          DetailScreen.routeName: (context) => DetailScreen(ModalRoute.of(context)?.settings.arguments as String)
        },
      ),
    );
  }
}
