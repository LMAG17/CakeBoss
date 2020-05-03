import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SalesState extends Equatable {
  const SalesState();
  @override
  List<Object> get props => [];
}

class SalesInitial extends SalesState {}

class Loading extends SalesState {}

class Failure extends SalesState {}

class Success extends SalesState {
  final List<charts.Series> dataDayOrders;
  final List<charts.Series> dataStoreOrders;
  final List<charts.Series> dataStripes;
  final List<charts.Series> dataDayOrdersTime;
  final List<charts.Series> dataProducts;
  final List<charts.Series> dataDeliveyAfterHours;
  final List<charts.Series> dataTicketDay;
  final List<charts.Series> dataTicketStore;

  final List<PedidosTienda> storeOrders;
  List<PedidosTienda> storeOrdersSelected;
  final List<PedidosDia> dayOrders;
  List<PedidosDia> dayOrdersSelected;
  final List<FranjaHor> stripes;
  final List<TicketDay> ticketDay;
  List<TicketDay> ticketDaySelected;
  final List<TicketStore> ticketStore;
  List<TicketStore> ticketStoreSelected;
  final List<PopularProducts> products;
  List<PopularProducts> productsSelected;
  final List<DeliveriesAfterHours> deliveryAfterHour;
  Success({
    this.storeOrders,
    this.storeOrdersSelected,
    this.dayOrders,
    this.dayOrdersSelected,
    this.stripes,
    this.ticketDay,
    this.ticketDaySelected,
    this.ticketStore,
    this.ticketStoreSelected,
    this.products,
    this.productsSelected,
    this.deliveryAfterHour,
    @required this.dataStoreOrders,
    @required this.dataStripes,
    @required this.dataDayOrdersTime,
    @required this.dataProducts,
    @required this.dataDeliveyAfterHours,
    @required this.dataTicketDay,
    @required this.dataTicketStore,
    @required this.dataDayOrders,
  });
}
