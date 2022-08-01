
import 'package:bottom_nav_final/navbar2/page_a.dart';
import 'package:bottom_nav_final/navbar2/page_b.dart';
import 'package:bottom_nav_final/navbar2/page_c.dart';
import 'package:bottom_nav_final/navbar2/page_d.dart';
import 'package:bottom_nav_final/navbar2/page_e.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


import 'Page_e.dart';
class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _page =0;

  final pages =[Access_Alarm(),Ac_Unit(),Accessible(),Favorite()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(

        index: 0,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blue,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index){
          //_page=index;
          setState(() {
            _page=index;

          });
        },
        items: [
          Icon(Icons.timer),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.add_call),
        //  Icon(Icons.favorite),

        ],
      ),
      body: pages[_page],
    );
  }
}
