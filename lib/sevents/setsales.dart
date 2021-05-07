import 'package:supply_cabinet/smodel/sale.dart';
import 'saleevent.dart';

class SetSales extends SaleEvent {
  List<Sale> saleList;

  SetSales(List<Sale> sales) {
    saleList = sales;
  }
}
