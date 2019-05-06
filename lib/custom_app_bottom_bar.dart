import 'package:flight_ticket_app/main.dart';
import 'package:flutter/material.dart';

class CustomAppBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavigationBarItemStyle = TextStyle(
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  CustomAppBottomBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home, color: appTheme.primaryColor),
        title: Text('Explore',
            style: bottomNavigationBarItemStyle.copyWith(
                color: appTheme.primaryColor)),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite, color: Colors.black),
        title: Text('Watchist', style: bottomNavigationBarItemStyle),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer, color: Colors.black),
        title: Text('Deals', style: bottomNavigationBarItemStyle),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.black),
        title: Text('Notifications', style: bottomNavigationBarItemStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
