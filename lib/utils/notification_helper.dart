import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reaturant_app/common/navigation.dart';
import 'package:reaturant_app/data/model/model.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>() ;

class NotificationHelper {
  static NotificationHelper? _instance ;
  NotificationHelper._internal() {
    _instance = this ;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal() ;

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');


    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
          if (payload != null) {
            print('notification payload: ' + payload);
          }
          selectNotificationSubject.add(payload ?? 'empty payload');
        });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      RestaurantResult restaurant) async {
    var _channelId = "1";
    var _channelName = "channel_01";
    var _channelDescription = "Restaurant Channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription:  _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: DefaultStyleInformation(true, true)
    );


    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, );

    var titleNotification = "<b>Restaurant</b>";
    var titleResto  = restaurant.restaurants[0].name  ;

    await flutterLocalNotificationsPlugin.show(
        0,
        titleNotification,
        titleResto,
        platformChannelSpecifics,
        payload: json.encode(restaurant.toJson()));
  }
  
  
  

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen(
          (String payload) async {
        var data = RestaurantResult.fromJson(json.decode(payload));
        var restaurant = data.restaurants[0];
        Navigation.withIntentData(route, restaurant) ;
      },
    );
  }

}