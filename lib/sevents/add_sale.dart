import 'package:supply_cabinet/smodel/sale.dart';
import 'package:supply_cabinet/sevents/saleevent.dart';

class AddSale extends SaleEvent {
  Sale newSale;

  AddSale(Sale sale) {
    newSale = sale;
  }
}
