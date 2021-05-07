import 'package:flutter/material.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class Stocks extends StatefulWidget {
  @override
  _StocksState createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        bottomNavigationBar: botttombar(),
        body: Column(
          children: <Widget>[
            Container(
              child: Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text("Coco Cola"),
                  subtitle: Text("Price : 100"),
                  trailing: GestureDetector(
                    child: Text("Quantity : 1000"),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                title: Text("Dettol Soap"),
                subtitle: Text("Price : 50"),
                trailing: GestureDetector(
                  child: Text("Quantity : 3500"),
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                title: Text("Lays Wafers"),
                subtitle: Text("Price : 15"),
                trailing: GestureDetector(
                  child: Text("Quantity : 2500"),
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
                title: Text("Kurkure"),
                subtitle: Text("Price : 45"),
                trailing: GestureDetector(
                  child: Text("Quantity : 1500"),
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                title: Text("Spices"),
                subtitle: Text("Price : 80"),
                trailing: GestureDetector(
                  child: Text("Quantity : 500"),
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                title: Text("KingFisher Ultra Beer"),
                subtitle: Text("Price : 180"),
                trailing: GestureDetector(
                  child: Text("Quantity : 5000"),
                ),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                title: Text("Biscuits"),
                subtitle: Text("Price : 10"),
                trailing: GestureDetector(
                  child: Text("Quantity : 1000"),
                ),
              ),
            ),
            /*Card(
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
            )
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
            ),*/
          ],
        ));
  }
}
