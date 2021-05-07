import 'package:supply_cabinet/events/add_product.dart';
import 'package:supply_cabinet/events/delete_product.dart';
import 'package:supply_cabinet/events/product_event.dart';
import 'package:supply_cabinet/events/set_products.dart';
import 'package:supply_cabinet/events/update_product.dart';
import 'package:supply_cabinet/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, List<Product>> {
  @override
  List<Product> get initialState => List<Product>();

  @override
  Stream<List<Product>> mapEventToState(ProductEvent event) async* {
    if (event is SetProducts) {
      yield event.productList;
    } else if (event is AddProduct) {
      List<Product> newState = List.from(state);
      if (event.newProduct != null) {
        newState.add(event.newProduct);
      }
      yield newState;
    } else if (event is DeleteProduct) {
      List<Product> newState = List.from(state);
      newState.removeAt(event.productIndex);
      yield newState;
    } else if (event is UpdateProduct) {
      List<Product> newState = List.from(state);
      newState[event.productIndex] = event.newProduct;
      yield newState;
    }
  }
}
