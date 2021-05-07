import 'package:supply_cabinet/model/product.dart';

import 'product_event.dart';

class SetProducts extends ProductEvent {
  List<Product> productList;

  SetProducts(List<Product> products) {
    productList = products;
  }
}
