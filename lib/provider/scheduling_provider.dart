import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:reaturant_app/utils/background_service.dart';
import 'package:reaturant_app/utils/date_time_helpe.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false ;
  bool get isScheduled => _isScheduled ;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value ;
    if (_isScheduled) {
      print("Schedule Active") ;
      notifyListeners();
      return await AndroidAlarmManager.periodic(
          Duration(hours: 24),
          1,
          BackgroundService.callback ,
        startAt: DateTimeHelper.format(),
        exact:  true ,
        wakeup:  true
      ) ;
    } else {
      print ('Scheduled canceled') ;
      notifyListeners() ;
      return await AndroidAlarmManager.cancel(1) ;
    }
  }
}