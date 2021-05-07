import 'package:supply_cabinet/bloc/product_bloc.dart';
import 'package:supply_cabinet/db/database_provider.dart';
import 'package:supply_cabinet/events/delete_product.dart';
import 'package:supply_cabinet/events/set_products.dart';
import 'package:supply_cabinet/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_cabinet/product_form.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getProducts().then(
      (productList) {
        BlocProvider.of<ProductBloc>(context).add(SetProducts(productList));
      },
    );
  }

  showProductDialog(BuildContext context, Product product, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product.productName),
        content: Text("ID ${product.id}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductForm(product: product, productIndex: index),
              ),
            ),
            child: Text("Update"),
          ),
          FlatButton(
            onPressed: () => DatabaseProvider.db.delete(product.id).then((_) {
              BlocProvider.of<ProductBloc>(context).add(
                DeleteProduct(index),
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
    print("Building entire product list scaffold");
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
          )
        ),
        child: BlocConsumer<ProductBloc, List<Product>>(
          builder: (context, productList) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                print("productList: $productList");

                Product product = productList[index];
                return ListTile(
                    title: Text("Product Name : ${product.productName}",
                        style: TextStyle(fontSize: 30)),
                    subtitle: Text(
                      "Vendor Name : ${product.venderName}\nQuantity : ${product.quentity}\nPurchase Price: ${product.purchasePrice}",
                      style: TextStyle(fontSize: 25 ),
                    ),
                    onTap: () => showProductDialog(context, product, index));
              },
              itemCount: productList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Colors.black),
            );
          },
          listener: (BuildContext context, productList) {},
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => ProductForm()),
        ),
      ),*/
    );
  }
}
