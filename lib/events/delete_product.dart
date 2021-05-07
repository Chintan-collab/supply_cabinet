import 'product_event.dart';

class DeleteProduct extends ProductEvent {
  int productIndex;

  DeleteProduct(int index) {
    productIndex = index;
  }
}
