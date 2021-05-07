import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:supply_cabinet/signin.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
Widget appBarMain(BuildContext context)
{
  return AppBar(
    centerTitle: true,
    title: Text("Supply Cabinet",style: TextStyle(
      color: Colors.white,
    ),),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.blueGrey[900],
            Colors.white,
            ]
        )
      ),
    ),
  );
}
InputDecoration textFieldInputDecoration(String hint)
{
  return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:Colors.white),
      ),
    );
}
TextStyle simpleTextStyle()
{
  return TextStyle(
      color:Colors.black,
    fontSize: 20,
  );
}
TextStyle buttonTextStyle()
{
  return TextStyle(
    color:Colors.black54,
    fontSize: 16,
  );
}
Widget botttombar()
{
  int _sIndex = 0;
  return GradientBottomNavigationBar(
  backgroundColorStart: Colors.blueGrey[900],
    backgroundColorEnd: Colors.white,
    items: [
      BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        title: new Text("Home",style: TextStyle(color: Colors.black),),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.person),
        title: new Text("Profile",style: TextStyle(color: Colors.black),),
      ),
    ],
    currentIndex: _sIndex,
  );
}
BoxDecoration gradientbutton()
{
  return BoxDecoration(
    gradient: LinearGradient(
      colors:<Color>[
        Colors.blueGrey[300],
        Colors.white,
      ],
    ),
  );
}