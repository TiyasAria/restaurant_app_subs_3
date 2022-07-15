import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reaturant_app/common/theme.dart';
import 'package:reaturant_app/provider/scheduling_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
   static const routeName = '/settingScreen' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Setting Page' , style: commonText.copyWith( fontWeight: FontWeight.bold, fontSize: 28),),
                SizedBox(height: 10,),
                ListTile(
                  title: Text('Schedule Restaurant' , style: commonText,),
                  trailing: Consumer<SchedulingProvider>(
                      builder: (context , data, _) {
                        return Switch.adaptive(
                            value: data.isScheduled,
                            onChanged: (value) async {
                              data.scheduledNews(value) ;

                            });
                      }
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
