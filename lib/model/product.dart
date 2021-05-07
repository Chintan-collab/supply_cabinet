import 'package:supply_cabinet/db/database_provider.dart';

class Product {
  int id;
  String productName;
  String venderName;
  String quentity;
  String purchasePrice;

  Product(
      {this.id,
      this.productName,
      this.venderName,
      this.quentity,
      this.purchasePrice});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_PRODUCTNAME: productName,
      DatabaseProvider.COLUMN_VENDERNAME: venderName,
      DatabaseProvider.COLUMN_QUENTITY: quentity,
      DatabaseProvider.COLUMN_PURCHASEPRICE: purchasePrice,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    productName = map[DatabaseProvider.COLUMN_PRODUCTNAME];
    venderName = map[DatabaseProvider.COLUMN_VENDERNAME];
    quentity = map[DatabaseProvider.COLUMN_QUENTITY];
    purchasePrice = map[DatabaseProvider.COLUMN_PURCHASEPRICE];
  }
}
