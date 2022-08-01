import 'package:bottom_nav_final/simple_nav/simplePages.dart';
import 'package:flutter/material.dart';
class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedItem =0;
  var  pagesData = [HomePage(),Aboutpage(),Favaritepage() ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom"),
      ),
      body: Center(
        child:
        //Text("Oshin hossain"),
        pagesData [selectedItem],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favarite"),
          BottomNavigationBarItem(icon: Icon(Icons.info),label: "About"),

        ],
        currentIndex: selectedItem,
        onTap: (setValue){
          setState(() {
            selectedItem=setValue;
          });
        },
      ),
    );
  }
}
