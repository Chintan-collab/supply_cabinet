import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply_cabinet/navigation%20pages/product_form.dart';
/*import 'package:supply_cabinet/navigation%20pages/productlist.dart';
import 'package:supply_cabinet/navigation%20pages/profitloss.dart';
import 'package:supply_cabinet/navigation%20pages/purchaselist.dart';
import 'package:supply_cabinet/navigation%20pages/saleslist.dart';
import 'package:supply_cabinet/navigation%20pages/stocklist.dart';
import 'package:supply_cabinet/navigation%20pages/vendorlist.dart';
*/import 'package:supply_cabinet/product_list.dart';
import 'package:supply_cabinet/profit-loss.dart';
import 'package:supply_cabinet/saleform.dart';
import 'package:supply_cabinet/salelist.dart';
import 'package:supply_cabinet/stock_in_hand.dart';

//import '../saleform.dart';
class IconContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.cyan[900],
              Colors.cyan[300],
            ],
        ),
      ),
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(15),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context,
            MaterialPageRoute( builder: (context) => ProductForm(),),
            );
          },
            child: Container(

              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 69),
                  child: Text("Purchase(+)",style: TextSt(), )),
              decoration: grad(),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => SaleForm(),),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 69),
                  child: Text("Sales(+)" , style: TextSt(),)),
              decoration: grad(),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => ProductList(),),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 69),
                  child: Text("Purchase Order", style: TextSt(),)),
              decoration: grad(),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => SaleList(),),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 69),
                  child: Text("Sales Order",style: TextSt(),)),
              decoration: grad(),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => Stocks(),),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 69),
                  child: Text("Stock List", style: TextSt(),)),
              decoration: grad(),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute( builder: (context) => Profit(),),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 69),
                  child: Text("Profit-Loss",style: TextSt(),),),
              decoration: grad(),
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration grad()
{
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.blueGrey[300],
        Colors.white,
      ]
    ),
    borderRadius: BorderRadius.circular(12),
  );
}
TextStyle TextSt()
{
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
  );
}