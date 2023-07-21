import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        scrolledUnderElevation: 5,
      ),
      drawer: CurvedDrawer(
        color: Color(0xE2FF96DD),
        labelColor: Colors.black87,
        width: 75.0,
        items: <DrawerItem>[
          DrawerItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "Profile"),
          DrawerItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: "Setting"),
          DrawerItem(
              icon: Icon(Icons.location_on, color: Colors.white),
              label: "Location"),
          DrawerItem(
              icon: Icon(Icons.calendar_month_outlined, color: Colors.white),
              label: "Dates"),
          DrawerItem(
              icon: Icon(Icons.logout, color: Colors.white), label: "Logout"),
        ],
        onTap: (int value) {},
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/back2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xE2FF96DD),
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
