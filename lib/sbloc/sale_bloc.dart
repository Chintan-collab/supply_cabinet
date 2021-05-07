import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply_cabinet/sevents/add_sale.dart';
import 'package:supply_cabinet/sevents/delete_sale.dart';
import 'package:supply_cabinet/sevents/saleevent.dart';
import 'package:supply_cabinet/sevents/setsales.dart';
import 'package:supply_cabinet/sevents/updatesales.dart';
import 'package:supply_cabinet/smodel/sale.dart';

class SaleBloc extends Bloc<SaleEvent, List<Sale>> {
  @override
  List<Sale> get initialState => List<Sale>();

  @override
  Stream<List<Sale>> mapEventToState(SaleEvent event) async* {
    if (event is SetSales) {
      yield event.saleList;
    } else if (event is AddSale) {
      List<Sale> newState = List.from(state);
      if (event.newSale != null) {
        newState.add(event.newSale);
      }
      yield newState;
    } else if (event is DeleteSale) {
      List<Sale> newState = List.from(state);
      newState.removeAt(event.saleIndex);
      yield newState;
    } else if (event is UpdateSale) {
      List<Sale> newState = List.from(state);
      newState[event.saleIndex] = event.newSale;
      yield newState;
    }
  }
}
