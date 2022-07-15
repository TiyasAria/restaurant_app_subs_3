import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>() ;

class Navigation {
  static withIntentData (String route , Object arguments) {
    navigatorKey.currentState?.pushNamed(route, arguments: arguments) ;
  }

  static back () => navigatorKey.currentState?.pop() ;
}