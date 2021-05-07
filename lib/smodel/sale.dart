import 'package:supply_cabinet/sdb/database_provider1.dart';

class Sale {
  int id;
  String saleName;
  String customerName;
  String quentity;
  String salePrice;

  Sale(
      {this.id,
      this.saleName,
      this.customerName,
      this.quentity,
      this.salePrice});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_SALENAME: saleName,
      DatabaseProvider.COLUMN_CUSTOMERNAME: customerName,
      DatabaseProvider.COLUMN_QUENTITY: quentity,
      DatabaseProvider.COLUMN_SALEPRICE: salePrice,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  Sale.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    saleName = map[DatabaseProvider.COLUMN_SALENAME];
    customerName = map[DatabaseProvider.COLUMN_CUSTOMERNAME];
    quentity = map[DatabaseProvider.COLUMN_QUENTITY];
    salePrice = map[DatabaseProvider.COLUMN_SALEPRICE];
  }
}
