import 'package:supply_cabinet/model/product.dart';

import 'product_event.dart';

class UpdateProduct extends ProductEvent {
  Product newProduct;
  int productIndex;

  UpdateProduct(int index, Product product) {
    newProduct = product;
    productIndex = index;
  }
}
