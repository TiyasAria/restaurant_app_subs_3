import 'package:flutter/material.dart';
import 'package:reaturant_app/ui/favorite_screen.dart';
import 'package:reaturant_app/ui/setting_screen.dart';
import 'package:reaturant_app/utils/notification_helper.dart';

import 'detail_screen.dart';
import 'list_restaurant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/homeScreen' ;


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //first make a var for index and pages
  List<Map<String , dynamic>>? _pages ;
  int _selectedPage = 0 ;
  //maka notification helper in here
  final NotificationHelper _notificationHelper = NotificationHelper();


  // make a func for tap in icon
void _itemOnTap(int index) {
  setState(() {
    _selectedPage = index ;
  });
}

  // daftarkan seluruh page yang dipunya didalam init state

  @override
  void initState() {
    // TODO: implement initState

    _pages = [
     {
       "pages" : ListRestaurantScreen(),
     },
      {
        "pages" : FavoriteScreen(),
      },
      {
        "pages" : SettingScreen(),
      }
    ];

    super.initState();
    _notificationHelper.configureSelectNotificationSubject(DetailScreen.routeName) ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selectNotificationSubject.close();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedPage]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          items :const <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant , size:  24,),
                label: 'Restaurant'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded , size:  24,),
                label: 'Favorite'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings , size:  24,),
                label: 'Setting'
              ),
          ],
        currentIndex: _selectedPage,
        onTap: _itemOnTap,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
