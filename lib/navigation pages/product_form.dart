import 'package:supply_cabinet/bloc/product_bloc.dart';
import 'package:supply_cabinet/db/database_provider.dart';
import 'package:supply_cabinet/events/add_product.dart';
import 'package:supply_cabinet/events/update_product.dart';
import 'package:supply_cabinet/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class ProductForm extends StatefulWidget {
  final Product product;
  final int productIndex;

  ProductForm({this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return ProductFormState();
  }
}

class ProductFormState extends State<ProductForm> {
  String _productName;
  String _vendername;
  String _quentity;
  String _purchaseprice;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildProductName() {
    return TextFormField(
      initialValue: _productName,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Product Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Product Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _productName = value;
      },
    );
  }

  Widget _buildVenderName() {
    return TextFormField(
      initialValue: _vendername,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Vendor Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Vendor Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _vendername = value;
      },
    );
  }

  Widget _buildQuentity() {
    return TextFormField(
      initialValue: _quentity,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Quantity'),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        int quentity = int.tryParse(value);

        if (quentity == null || quentity <= 0) {
          return 'Quantity must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _quentity = value;
      },
    );
  }

  Widget _buildPurchasePrice() {
    return TextFormField(
      initialValue: _purchaseprice,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Purchase Price'),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        int purchaseprice = int.tryParse(value);

        if (purchaseprice == null || purchaseprice <= 0) {
          return 'Purchase price must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _purchaseprice = value;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _productName = widget.product.productName;
      _vendername = widget.product.venderName;
      _quentity = widget.product.quentity;
      _purchaseprice = widget.product.purchasePrice;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.circular(12),
          ),
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildProductName(),
              _buildVenderName(),
              //SizedBox(height: 16),
              _buildQuentity(),
              _buildPurchasePrice(),
              //SizedBox(height: 16),
              widget.product == null
                  ? RaisedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        Product product = Product(
                          productName: _productName,
                          venderName: _vendername,
                          quentity: _quentity,
                          purchasePrice: _purchaseprice,
                        );

                        DatabaseProvider.db.insert(product).then(
                              (storedProduct) =>
                                  BlocProvider.of<ProductBloc>(context).add(
                                AddProduct(storedProduct),
                              ),
                            );

                        Navigator.pop(context);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              print("form");
                              return;
                            }

                            _formKey.currentState.save();

                            Product product = Product(
                              productName: _productName,
                              venderName: _vendername,
                              quentity: _quentity,
                              purchasePrice: _purchaseprice,
                            );

                            DatabaseProvider.db.update(widget.product).then(
                                  (storedProduct) =>
                                      BlocProvider.of<ProductBloc>(context).add(
                                    UpdateProduct(widget.productIndex, product),
                                  ),
                                );

                            Navigator.pop(context);
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
