import 'package:bottom_nav_final/navbar_gunjon/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.of(context).pop();
          //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>HomeScreen()));
        }),
        title: Text("About",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          Icon(Icons.edit),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: primaryColor,
        elevation: 0,
      ),body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(child: Text("About",)),

    ),
    );
  }
}
