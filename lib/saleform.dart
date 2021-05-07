import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_cabinet/smodel/sale.dart';
import 'package:supply_cabinet/sbloc/sale_bloc.dart';
import 'package:supply_cabinet/sevents/add_sale.dart';
import 'package:supply_cabinet/sevents/updatesales.dart';
import 'package:supply_cabinet/sdb/database_provider1.dart';
import 'package:supply_cabinet/widgets/widget.dart';

class SaleForm extends StatefulWidget {
  final Sale sale;
  final int saleIndex;

  SaleForm({this.sale, this.saleIndex});

  @override
  State<StatefulWidget> createState() {
    return SaleFormState();
  }
}

class SaleFormState extends State<SaleForm> {
  String _saleName;
  String _customername;
  String _quentity;
  String _saleprice;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildSaleName() {
    return TextFormField(
      initialValue: _saleName,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Sale Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Sale Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _saleName = value;
      },
    );
  }

  Widget _buildVenderName() {
    return TextFormField(
      initialValue: _customername,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Customer Name'),
      maxLength: 15,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Customer Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _customername = value;
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
      initialValue: _saleprice,
      textAlign: TextAlign.center,
      decoration: InputDecoration(labelText: 'Sale Price'),
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 28,color: Colors.black),
      validator: (String value) {
        int saleprice = int.tryParse(value);

        if (saleprice == null || saleprice <= 0) {
          return 'Purchase price must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _saleprice = value;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.sale != null) {
      _saleName = widget.sale.saleName;
      _customername = widget.sale.customerName;
      _quentity = widget.sale.quentity;
      _saleprice = widget.sale.salePrice;
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
              _buildSaleName(),
              _buildVenderName(),
              //SizedBox(height: 16),
              _buildQuentity(),
              _buildPurchasePrice(),
              //SizedBox(height: 20),
              widget.sale == null
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

                        Sale sale = Sale(
                          saleName: _saleName,
                          customerName: _customername,
                          quentity: _quentity,
                          salePrice: _saleprice,
                        );

                        DatabaseProvider.db.insert(sale).then(
                              (storedSale) =>
                                  BlocProvider.of<SaleBloc>(context).add(
                                AddSale(storedSale),
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

                            Sale sale = Sale(
                              saleName: _saleName,
                              customerName: _customername,
                              quentity: _quentity,
                              salePrice: _saleprice,
                            );

                            DatabaseProvider.db.update(widget.sale).then(
                                  (storedSale) =>
                                      BlocProvider.of<SaleBloc>(context).add(
                                    UpdateSale(widget.saleIndex, sale),
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
