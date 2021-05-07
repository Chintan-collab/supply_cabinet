import 'package:supply_cabinet/model/product.dart';

import 'product_event.dart';

class AddProduct extends ProductEvent {
  Product newProduct;

  AddProduct(Product product) {
    newProduct = product;
  }
}
