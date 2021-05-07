import 'package:flutter/material.dart';
import 'package:supply_cabinet/home/homepagecolumns.dart';
import 'package:supply_cabinet/views/sidemenu.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: appBarMain(context),
      drawer: NavDrawer(),
      bottomNavigationBar: botttombar(),
      body: IconContainer(),
    );
  }
}
