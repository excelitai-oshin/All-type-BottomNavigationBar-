import 'dart:io';
import 'package:bottom_nav_final/navbar_gunjon/about-page.dart';
import 'package:bottom_nav_final/navbar_gunjon/my_profile.dart';
import 'package:bottom_nav_final/navbar_gunjon/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = -1;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor, //Colors.purple,
        centerTitle: true,
        title: Text("Payments Receipt List"),
        actions: [
          IconButton(onPressed: ()async{

            // if (Platform.isAndroid) {
            //   await LocalStorageStore().userDeleteToken();
            //   SystemNavigator.pop();
            // } else if (Platform.isIOS) {
            //   await LocalStorageStore().userDeleteToken();
            //   exit(0);
            // }

          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
     // drawer: NavigationDrawer(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentIndex == -1 ? primaryColor : secondaryColor,
        onPressed: () {
          setState(() {
            currentIndex = -1;
          });
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...MainMenuModel.list.map(
                  (MainMenuModel data) {
                return data.isBlank
                    ? const SizedBox(
                  width: 10,
                )
                    : InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = data.index;
                      if(currentIndex==0){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }
                      if(currentIndex==1){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Screen()));
                      }
                      if(currentIndex==2){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
                      }
                      if(currentIndex==3){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
                      }
                    });
                    // ignore: avoid_print
                    print(data.index.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //SizedBox(height: 10,),
                        Icon(
                          data.icon,
                          color: currentIndex == data.index
                              ? primaryColor
                              : secondaryColor,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          data.label!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                              color: currentIndex == data.index
                                  ? primaryColor
                                  : secondaryColor),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Color(0xfffcf8e3);
  }

  _getBody() {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return Container();
      case 2:
        return MyProfile();
      case 3:
        return AboutPage();
      default:
        return _buildHompageBody;
    }
  }


  Widget _buildHompageBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Text("Home_page")

        ],
      ),
    );
  }
}

class MainMenuModel {
  late final int index;
  late final IconData? icon;
  late final String? label;
  late final bool isBlank;
  MainMenuModel(
      {required this.index, this.label, this.icon, this.isBlank = false});

  static List<MainMenuModel> list = [
    MainMenuModel(
      index: 0,
      label: 'Home',
      icon: FontAwesomeIcons.home,
    ),
    MainMenuModel(
      index: 1,
      label: 'Notification',
      icon: FontAwesomeIcons.bell,
    ),
    MainMenuModel(
      index: -1,
      isBlank: true,
    ),
    MainMenuModel(
      index: 2,
      label: 'Profile',
      icon: FontAwesomeIcons.userAlt,
    ),
    MainMenuModel(
      index: 3,
      label: 'About',
      icon: FontAwesomeIcons.indent,
    ),
  ];
}
