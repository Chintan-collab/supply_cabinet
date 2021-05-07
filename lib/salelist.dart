import 'package:supply_cabinet/sbloc/sale_bloc.dart';
import 'package:supply_cabinet/sdb/database_provider1.dart';
import 'package:supply_cabinet/sevents/delete_sale.dart';
import 'package:supply_cabinet/sevents/setsales.dart';
import 'package:supply_cabinet/smodel/sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_cabinet/saleform.dart';
import 'package:supply_cabinet/widgets/widget.dart';

/*class SaleList extends StatefulWidget {
  const SaleList({Key key}) : super(key: key);

  @override
  _SaleListState createState() => _SaleListState();
}

class _SaleListState extends State<SaleList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getSales().then(
      (saleList) {
        BlocProvider.of<SaleBloc>(context).add(SetSales(saleList));
      },
    );
  }

  showSaleDialog(BuildContext context, Sale sale, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sale.saleName),
        content: Text("ID ${sale.id}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SaleForm(sale: sale, saleIndex: index),
              ),
            ),
            child: Text("Update"),
          ),
          FlatButton(
            onPressed: () => DatabaseProvider.db.delete(sale.id).then((_) {
              BlocProvider.of<SaleBloc>(context).add(
                DeleteSale(index),
              );
              Navigator.pop(context);
            }),
            child: Text("Delete"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building entire sale list scaffold");
    return Scaffold(
      appBar: appBarMain(context),
      bottomNavigationBar: botttombar(),
      body: Container(
        child: BlocConsumer<SaleBloc, List<Sale>>(
          builder: (context, saleList) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                print("saleList: $saleList");

                Sale sale = saleList[index];
                return ListTile(
                    title: Text("Sale Name : ${sale.saleName}",
                        style: TextStyle(fontSize: 30)),
                    subtitle: Text(
                      "Customer Name : ${sale.customerName}\nQuentity : ${sale.quentity}\nSale Price: ${sale.salePrice}",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () => showSaleDialog(context, sale, index));
              },
              itemCount: saleList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.black),
            );
          },
          listener: (BuildContext context, saleList) {},
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => SaleForm()),
        ),
      ),*/
    );
  }
}
*/
class SaleList extends StatefulWidget {
  const SaleList({Key key}) : super(key: key);

  @override
  _SaleListState createState() => _SaleListState();
}

class _SaleListState extends State<SaleList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getSales().then(
          (saleList) {
        BlocProvider.of<SaleBloc>(context).add(SetSales(saleList));
      },
    );
  }

  showSaleDialog(BuildContext context, Sale sale, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sale.saleName),
        content: Text("ID ${sale.id}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SaleForm(sale: sale, saleIndex: index),
              ),
            ),
            child: Text("Update"),
          ),
          FlatButton(
            onPressed: () => DatabaseProvider.db.delete(sale.id).then((_) {
              BlocProvider.of<SaleBloc>(context).add(
                DeleteSale(index),
              );
              Navigator.pop(context);
            }),
            child: Text("Delete"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building entire sale list scaffold");
    return Scaffold(
      appBar: appBarMain(context),
     bottomNavigationBar: botttombar(),
     body: Container(
     decoration: BoxDecoration(
     gradient: LinearGradient(
     colors: [
      Colors.teal[300],
      Colors.red[300],
     ]
    ),
    ),
        child: BlocConsumer<SaleBloc, List<Sale>>(
          builder: (context, saleList) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                print("SaleList: $saleList");

                Sale sale = saleList[index];
                return ListTile(
                    title: Text("Sale Name : ${sale.saleName}",
                        style: TextStyle(fontSize: 30)),
                    subtitle: Text(
                      "Customer Name : ${sale.customerName}\nQuantity : ${sale.quentity}\nSale Price: ${sale.salePrice}",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () => showSaleDialog(context, sale, index));
              },
              itemCount: saleList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.black),
            );
          },
          listener: (BuildContext context, saleList) {},
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => SaleForm()),
        ),
      ),*/
    );
  }
}