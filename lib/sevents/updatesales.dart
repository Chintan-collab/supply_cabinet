import 'package:supply_cabinet/sevents/saleevent.dart';
import 'package:supply_cabinet/smodel/sale.dart';

class UpdateSale extends SaleEvent {
  Sale newSale;
  int saleIndex;

  UpdateSale(int index, Sale sale) {
    newSale = sale;
    saleIndex = index;
  }
}
