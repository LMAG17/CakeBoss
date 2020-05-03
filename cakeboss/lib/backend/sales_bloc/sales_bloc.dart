import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bloc/bloc.dart';
import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:charts_flutter/flutter.dart';
import 'bloc.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  DateTime initialDate = DateTime.now().add(Duration(days: -11));
  DateTime finalDate = DateTime.now().add(Duration(days: 1));
  List<PedidosTienda> storeOrders = [];
  List<PedidosTienda> storeOrdersSelected = [];
  List<PedidosDia> dayOrders = [];
  List<PedidosDia> dayOrdersSelected = [];
  List<FranjaHor> stripes = [];
  List<TicketDay> ticketDay = [];
  List<TicketDay> ticketDaySelected = [];
  List<TicketStore> ticketStore = [];
  List<TicketStore> ticketStoreSelected = [];
  List<PopularProducts> products = [];
  List<PopularProducts> productsSelected = [];
  List<DeliveriesAfterHours> deliveryAfterHour = [];
  @override
  SalesState get initialState => SalesInitial();

  @override
  Stream<SalesState> mapEventToState(
    SalesEvent event,
  ) async* {
    if (event is FetchData) {
      yield* _mapFetchDataToState(event.establisment);
    }
  }

  Stream<SalesState> _mapFetchDataToState(Login establishment) async* {
    yield Loading();
    try {
      yield Success(
        dataDayOrders: <Series>[],
        dataDayOrdersTime: <Series>[],
        dataDeliveyAfterHours: <Series>[],
        dataProducts: <Series>[],
        dataStoreOrders: <Series>[],
        dataStripes: <Series>[],
        dataTicketDay: <Series>[],
        dataTicketStore: <Series>[],
        dayOrders: dayOrders,
        dayOrdersSelected: dayOrdersSelected,
        storeOrders: storeOrders,
        storeOrdersSelected: storeOrdersSelected,
        stripes: stripes,
        ticketDay: ticketDay,
        ticketDaySelected: ticketDaySelected,
        ticketStore: ticketStore,
        ticketStoreSelected: ticketStoreSelected,
        products: products,
        productsSelected: productsSelected,
        deliveryAfterHour: deliveryAfterHour,
      );
    } catch (e) {
      yield Failure();
    }
  }
}
