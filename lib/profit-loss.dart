//import 'dart:async';
//import 'dart:html';
//import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class Profit extends StatefulWidget {
  @override
  _ProfitState createState() => _ProfitState();
}

class _ProfitState extends State<Profit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        bottomNavigationBar: botttombar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("AD Distributors"),
                  subtitle: Text("Price : 7,50,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("AK Sales Private Limited"),
                  subtitle: Text("Price : 50,000"),
                  trailing: GestureDetector(
                    child: Text("Purchased"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("DK Health Private Limited"),
                  subtitle: Text("Price : 1,50,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),
              /*Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("DK Sales"),
                  subtitle: Text("Price : 5,50,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),*/
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("MP Agency"),
                  subtitle: Text("Price : 4,50,000"),
                  trailing: GestureDetector(
                    child: Text("Purchased"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("Mahavir Health Agency"),
                  subtitle: Text("Price : 80,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("TN Distributors"),
                  subtitle: Text("Price : 10,80,000"),
                  trailing: GestureDetector(
                    child: Text("Purchased"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("AD Distributors"),
                  subtitle: Text("Price : 3,20,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("Mahavir Health Private Limited"),
                  subtitle: Text("Price : 4,95,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("MP Agency"),
                  subtitle: Text("Price : 1,10,000"),
                  trailing: GestureDetector(
                    child: Text("Purchased"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("DK Health Private Limited"),
                  subtitle: Text("Price : 2,50,000"),
                  trailing: GestureDetector(
                    child: Text("Sold"),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("AK Sales Private Limited"),
                  subtitle: Text("Price : 4,60,000"),
                  trailing: GestureDetector(
                    child: Text("Purchased"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
