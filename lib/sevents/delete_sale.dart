import 'package:supply_cabinet/sevents/saleevent.dart';

class DeleteSale extends SaleEvent {
  int saleIndex;

  DeleteSale(int index) {
    saleIndex = index;
  }
}
