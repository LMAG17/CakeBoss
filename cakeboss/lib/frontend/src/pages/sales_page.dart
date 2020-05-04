import 'package:cakeboss/backend/data/dataModel.dart';
import 'package:cakeboss/frontend/src/charts/bar.dart';
import 'package:cakeboss/frontend/src/charts/time.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class SalesPage extends StatefulWidget {
  Login login;
  SalesPage({Key key, @required this.login}) : super(key: key);

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final formato = NumberFormat('#,###');
  DateTime fechaInicial;
  DateTime fechaFinal;
  bool value = false;
  List<PedidosDia> data;

  List<TicketDay> dataTicket2;

  @override
  void initState() {
    super.initState();
  }

  List<PedidosTienda> dataPedidosTienda = [
    PedidosTienda('Chia Fruver', 154, 20042540),
    PedidosTienda('Bog sta fe', 106, 14683970),
    PedidosTienda('Bog Cdad Jardin', 100, 14326670),
    PedidosTienda('Bog Suba Vll eliza', 70, 10377460),
    PedidosTienda('Med volador', 69, 9179410),
    PedidosTienda('Med Tarapaca', 68, 8689390),
    PedidosTienda('Bog quintaparedes', 59, 7214370),
    PedidosTienda('Bog barranxas', 36, 5814170),
    PedidosTienda('Med el diamante', 34, 5016740),
    PedidosTienda('Bog suba salitre', 33, 4228320),
    PedidosTienda('Bog la uribe', 28, 2944420),
    PedidosTienda('Bog san javier', 19, 2741700),
    PedidosTienda('Bog country', 18, 2500430),
    PedidosTienda('Bog floresta', 14, 1792870),
  ];
  List<PedidosTienda> dataPedidosTiendaSelected = [];
  List<charts.Series<PedidosTienda, String>> _dataPedidosTiendaCant() {
    return [
      charts.Series<PedidosTienda, String>(
        id: 'Pedidos dia',
        data: dataPedidosTiendaSelected,
        domainFn: (PedidosTienda pedido, __) =>
            "Fecha: ${pedido.shop} => Cant ",
        measureFn: (PedidosTienda pedido, __) => pedido.amount,
        colorFn: (_,__) => charts.ColorUtil.fromDartColor(
            this.widget.login.establishment.colors.primary.toColor()),
        labelAccessorFn: (PedidosTienda pedido, _) =>
            '${pedido.shop}: ${pedido.amount}',
      ),
    ];
  }

  List<charts.Series<PedidosTienda, String>> _dataPedidosTiendaVal() {
    return [
      charts.Series<PedidosTienda, String>(
          id: 'Pedidos dia',
          data: dataPedidosTiendaSelected,
          domainFn: (PedidosTienda pedido, __) =>
              "Fecha: ${pedido.shop} => valor ",
          measureFn: (PedidosTienda pedido, __) => pedido.value,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (PedidosTienda pedido, _) =>
              '${pedido.shop}: ${formato.format(pedido.value)}')
    ];
  }

  List<PedidosDia> dataPedidosDia = [
    PedidosDia(DateTime.parse('2020-04-10'), 7, 399560),
    PedidosDia(DateTime.parse('2020-04-11'), 21, 2338430),
    PedidosDia(DateTime.parse('2020-04-12'), 42, 5623470),
    PedidosDia(DateTime.parse('2020-04-13'), 25, 3729670),
    PedidosDia(DateTime.parse('2020-04-14'), 18, 2180310),
    PedidosDia(DateTime.parse('2020-04-15'), 18, 3020260),
    PedidosDia(DateTime.parse('2020-04-16'), 13, 1990000),
    PedidosDia(DateTime.parse('2020-04-17'), 46, 7003620),
    PedidosDia(DateTime.parse('2020-04-18'), 294, 38556130),
    PedidosDia(DateTime.parse('2020-04-19'), 113, 15531570),
    PedidosDia(DateTime.parse('2020-04-20'), 227, 32647330),
  ];

  List<FranjaHor> dataFranjas = [
    FranjaHor('Mañana', 232, 31203240),
    FranjaHor('Tarde', 595, 81817110),
  ];
  List<charts.Series<FranjaHor, String>> _dataFranjasCant() {
    return [
      charts.Series<FranjaHor, String>(
        id: 'Franja horaria',
        data: dataFranjas,
        domainFn: (FranjaHor franja, __) => franja.tipo,
        measureFn: (FranjaHor franja, __) => franja.amount,
        colorFn: (_,__) => charts.ColorUtil.fromDartColor(
            this.widget.login.establishment.colors.primary.toColor()),
        labelAccessorFn: (FranjaHor franaja, _) =>
            '${franaja.tipo}: ${franaja.amount}',
      )
    ];
  }

  List<charts.Series<FranjaHor, String>> _dataFranjasVal() {
    return [
      charts.Series<FranjaHor, String>(
        id: 'Franja horaria',
        data: dataFranjas,
        domainFn: (FranjaHor franja, __) => franja.tipo,
        measureFn: (FranjaHor franja, __) => franja.value,
        colorFn: (_,__) => charts.ColorUtil.fromDartColor(
            this.widget.login.establishment.colors.primary.toColor()),
        labelAccessorFn: (FranjaHor franaja, _) =>
            '${franaja.tipo}: ${formato.format(franaja.value)}',
      )
    ];
  }

  List<charts.Series<PedidosDia, String>> _dataPedidosDiaCant() {
    return [
      charts.Series<PedidosDia, String>(
          id: 'Pedidos dia',
          data: data,
          domainFn: (PedidosDia pedido, __) =>
              "Fecha: ${pedido.day.month}/${pedido.day.day} => Cant ",
          measureFn: (PedidosDia pedido, __) => pedido.amount,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (PedidosDia pedido, _) =>
              '${pedido.day.day}/${pedido.day.month}/${pedido.day.year}: ${pedido.amount}')
    ];
  }

  List<charts.Series<PedidosDia, String>> _dataPedidosDiaVal() {
    return [
      charts.Series<PedidosDia, String>(
          id: 'Pedidos dia',
          data: data,
          domainFn: (PedidosDia pedido, __) =>
              "Fecha: ${pedido.day.month}/${pedido.day.day} => valor ",
          measureFn: (PedidosDia pedido, __) => pedido.value,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (PedidosDia pedido, _) =>
              '${pedido.day.day}/${pedido.day.month}/${pedido.day.year}: ${formato.format(pedido.value)}')
    ];
  }

  List<charts.Series<PedidosDia, DateTime>> _dataPedidosDiaCantTime() {
    return [
      charts.Series<PedidosDia, DateTime>(
        id: 'Pedidos dia',
        data: data,
        domainFn: (PedidosDia pedido, __) => pedido.day,
        measureFn: (PedidosDia pedido, __) => pedido.amount,
        colorFn: (_,__) => charts.ColorUtil.fromDartColor(
            this.widget.login.establishment.colors.primary.toColor()),
      )
    ];
  }

  List<charts.Series<PedidosDia, DateTime>> _dataPedidosDiaValTime() {
    return [
      charts.Series<PedidosDia, DateTime>(
        id: 'Pedidos dia',
        data: data,
        domainFn: (PedidosDia pedido, __) => pedido.day,
        measureFn: (PedidosDia pedido, __) => pedido.value,
        colorFn: (_,__) => charts.ColorUtil.fromDartColor(
            this.widget.login.establishment.colors.primary.toColor()),
      )
    ];
  }

  List<TicketDay> dataTicketDay = [
    TicketDay(DateTime.parse("2020-04-10"), 48294),
    TicketDay(DateTime.parse("2020-04-11"), 101076),
    TicketDay(DateTime.parse("2020-04-12"), 114728),
    TicketDay(DateTime.parse("2020-04-13"), 130059),
    TicketDay(DateTime.parse("2020-04-14"), 100341),
    TicketDay(DateTime.parse("2020-04-15"), 161807),
    TicketDay(DateTime.parse("2020-04-16"), 153077),
    TicketDay(DateTime.parse("2020-04-17"), 152253),
    TicketDay(DateTime.parse("2020-04-18"), 131143),
    TicketDay(DateTime.parse("2020-04-19"), 137488),
    TicketDay(DateTime.parse("2020-04-20"), 143243),
    TicketDay(DateTime.parse("2020-04-21"), 143054),
  ];

  List<charts.Series<TicketDay, String>> _dataTicket() {
    return [
      charts.Series(
          id: 'TicketDay Promedio',
          data: dataTicket2,
          domainFn: (TicketDay ticket, __) =>
              "Fecha: ${ticket.day.month}/${ticket.day.day} => valor ",
          measureFn: (TicketDay ticket, __) => ticket.value,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (TicketDay ticket, _) =>
              '${ticket.day.day}/${ticket.day.month}/${ticket.day.year}: ${formato.format(ticket.value)}')
    ];
  }

  List<TicketStore> dataTicketStore = [
    TicketStore("D1 - Cota Terracota", 80180),
    TicketStore("D1 - Medellin San Javier", 105251),
    TicketStore("D1 - MED Volador 2", 109950),
    TicketStore("D1 - Chia Frubver", 125469),
    TicketStore("D1 - Bogota Suba Salite", 126302),
    TicketStore("D1 - Medellin El diamante", 132139),
    TicketStore("D1 - Bogota Estacion Sabana", 134810),
    TicketStore("D1 - Bogota Santa Fe", 137296),
    TicketStore("D1 - Bogota La Uribe", 143591),
    TicketStore("D1 - Bogota Ciudad Jardin del Norte", 143591),
    TicketStore("D1 - Bogota Barrancas", 145471),
    TicketStore("D1 - Bogota Country", 149433),
    TicketStore("D1 - Chia Variante", 168372),
    TicketStore("D1 - Bogota Quintaparedes", 181869),
    TicketStore("D1 - Cajica San Jeronimo", 349360),
  ];

  List<charts.Series<TicketStore, String>> _dataTicketStore() {
    return [
      charts.Series(
          id: 'TicketStore Promedio',
          data: dataTicketStore,
          domainFn: (TicketStore ticket, __) => "${ticket.shop} => valor ",
          measureFn: (TicketStore ticket, __) => ticket.value,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (TicketStore ticket, _) =>
              '${ticket.shop}: ${formato.format(ticket.value)}')
    ];
  }

  List<PopularProducts> dataProducts = [
    PopularProducts('lacteos', 4847, 9000000),
    PopularProducts('Carne Pollo Pescado Y Cerdo', 1779, 8168220),
    PopularProducts('Carnes frías', 1622, 5463120),
    PopularProducts('Higiene Personal', 1489, 5301850),
    PopularProducts('Pasabocas', 1449, 5013360),
    PopularProducts('Galletería y dulces', 1363, 4699740),
    PopularProducts('Comidas Listas', 1321, 4197600),
    PopularProducts('Granos Y Panela', 1211, 4143060),
    PopularProducts('Enlatados y Envasados', 1161, 3846990),
    PopularProducts('Panaderia y Reposteria', 1136, 3766292),
    PopularProducts('Frutas Y verduras', 1080, 3756550),
    PopularProducts('Bebidas Alcoholicas', 1074, 3581470),
    PopularProducts('Margarinas y Aceites', 985, 3251670),
    PopularProducts('Cuidado ropa', 956, 3196390),
    PopularProducts('Limpieza Superficies y Cocina', 888, 3176390),
    PopularProducts('Bebidas liquidas', 847, 2970720),
    PopularProducts('Cereales Harinas Y Premezclas', 843, 2909630),
    PopularProducts('Desechables', 789, 2734500),
    PopularProducts('Huevos', 642, 2501050),
    PopularProducts('Salsas y Aderezos', 612, 2131130),
    PopularProducts('Aseo General', 558, 2014600),
    PopularProducts('Bebidas en Polvo', 538, 1754230),
    PopularProducts('Pastas', 496, 1636490),
    PopularProducts('Mascotas', 496, 1402470),
    PopularProducts('Medicamentos', 444, 1401570),
    PopularProducts('Utensilios', 365, 1047210),
    PopularProducts('Arepas', 263, 1033470),
    PopularProducts('Condimentos', 256, 939100),
    PopularProducts('Bebes', 200, 929500),
    PopularProducts('Belleza', 150, 474270),
  ];
  List<PopularProducts> dataProducts2 = [];
  List<charts.Series<PopularProducts, String>> _dataProductsCant() {
    return [
      charts.Series<PopularProducts, String>(
          id: 'Demanda productos',
          data: dataProducts2,
          domainFn: (PopularProducts product, __) => product.prod,
          measureFn: (PopularProducts product, __) => product.amount,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (PopularProducts product, _) =>
              '${product.prod}: ${formato.format(product.amount)}')
    ];
  }

  List<charts.Series<PopularProducts, String>> _dataProductsVal() {
    return [
      charts.Series<PopularProducts, String>(
          id: 'Demanda productos',
          data: dataProducts2,
          domainFn: (PopularProducts product, __) => product.prod,
          measureFn: (PopularProducts product, __) => product.value,
          colorFn: (_,__) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (PopularProducts product, _) =>
              '${product.prod}: ${formato.format(product.value)}')
    ];
  }

  List<DeliveriesAfterHours> dataDeliveriesAfterHours = [
    DeliveriesAfterHours(DateTime.parse("2020-04-19"), 1),
    DeliveriesAfterHours(DateTime.parse("2020-04-20"), 1),
    DeliveriesAfterHours(DateTime.parse("2020-04-21"), 6),
    DeliveriesAfterHours(DateTime.parse("2020-04-22"), 1),
  ];
  List<charts.Series<DeliveriesAfterHours, DateTime>>
      _dataDeliveriesAfterHours() {
    return [
      new charts.Series<DeliveriesAfterHours, DateTime>(
        id: 'Sales',
        data: dataDeliveriesAfterHours,
        domainFn: (DeliveriesAfterHours delivery, _) => delivery.day,
        measureFn: (DeliveriesAfterHours delivery, _) => delivery.value,
        colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
      )
    ];
  }

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    dataTicket2 = fechaInicial == null || fechaFinal == null
        ? dataTicketDay.where((i) => i.day.day < 13).toList()
        : dataTicketDay
            .where((i) =>
                i.day.isAfter(fechaInicial.add(Duration(days: -1))) &&
                i.day.isBefore(fechaFinal.add(Duration(days: 1))))
            .toList();
    data = fechaInicial == null || fechaFinal == null
        ? dataPedidosDia.where((i) => i.day.day < 13).toList()
        : dataPedidosDia
            .where((i) =>
                i.day.isAfter(fechaInicial.add(Duration(days: -1))) &&
                i.day.isBefore(fechaFinal.add(Duration(days: 1))))
            .toList();
    Color mainColor = this.widget.login.establishment.colors.primary.toColor();
    Color secondaryColor = this.widget.login.establishment.colors.secondary.toColor();
    return SafeArea(
      bottom: true,
      top: false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                this.widget.login.establishment.colors.primary.toColor(),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text("Cantidad"),
                ),
                Tab(
                  child: Text("Valor"),
                ),
                Tab(
                  child: Text("Ticket"),
                ),
              ],
            ),
            title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://chefmenu.co/restaurantes/bogota/tiendas-d1/tiendas-d1-logo.jpg'),
                        ),
                      ),
                      height: 24,
                      width: 24,
                    ),
                    Text('   Ventas')
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ButtonTheme(
                          minWidth: size.width / 3,
                          child: RaisedButton(
                              color: mainColor,
                              textColor: secondaryColor,
                              child: Text(fechaInicial != null
                                  ? "${fechaInicial.day}/${fechaInicial.month}/${fechaInicial.year}"
                                  : 'Fecha inicial'),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: fechaInicial != null
                                      ? fechaInicial
                                      : DateTime.now(),
                                  firstDate: dataPedidosDia.first.day,
                                  lastDate: DateTime.now(),
                                ).then((v) {
                                  fechaInicial = v;
                                  fechaFinal = v.add(Duration(days: 10));
                                  setState(() {});
                                });
                              }),
                        ),
                        ButtonTheme(
                          minWidth: size.width / 3,
                          child: RaisedButton(
                            elevation: 0,
                              color: mainColor,
                              textColor: secondaryColor,
                              child: Text(fechaFinal != null
                                  ? "${fechaFinal.day}/${fechaFinal.month}/${fechaFinal.year}"
                                  : 'Fecha final'),
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: fechaFinal != null
                                      ? fechaFinal
                                      : fechaInicial != null
                                          ? fechaInicial.add(Duration(days: 10))
                                          : DateTime.now(),
                                  firstDate: fechaInicial,
                                  lastDate:
                                      (fechaInicial.add(Duration(days: 10))),
                                ).then((v) {
                                  fechaFinal = v;
                                  setState(() {});
                                });
                              }),
                        )
                      ]),
                ]),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  child: Column(
                    children: <Widget>[
                      BarChart(
                        button: false,
                        height: size.height * (data.length / 20),
                        seriesList: _dataPedidosDiaCant(),
                        title: 'Cantidad de pedidos',
                      ),
                      TimeChart(
                        seriesList: _dataPedidosDiaCantTime(),
                        height: size.height * 0.3,
                        title: 'Cantidad de pedidos',
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Cantidad de pedidos por tienda',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _MyDialog(
                                              shatblisments: dataPedidosTienda,
                                              selectedStablishments:
                                                  dataPedidosTiendaSelected,
                                              onSelectedStablishmentsListChanged:
                                                  (cities) {
                                                setState(() {
                                                  dataPedidosTiendaSelected =
                                                      cities;
                                                });
                                           
                                              });
                                        });
                                  },
                                  child: Text('Elegir establecimientos')),
                              Container(
                                width: size.width,
                                height: size.height *
                                    (dataPedidosTiendaSelected.length / 30),
                                child:  dataPedidosTiendaSelected.length > 0
                                    ? charts.BarChart(
                                        _dataPedidosTiendaCant(),
                                        vertical: false,
                                        animate: true,
                                        barRendererDecorator:
                                            charts.BarLabelDecorator<String>(),
                                        domainAxis: charts.OrdinalAxisSpec(
                                            renderSpec:
                                                charts.NoneRenderSpec()),
                                      )
                                    : Text('Seleccione algun establecimiento'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Cantidad de pedidos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: size.width,
                                height: size.height * 0.3,
                                child: charts.PieChart(_dataFranjasCant(),
                                    animate: true,
                                    defaultRenderer: charts.ArcRendererConfig(
                                        arcWidth: 30,
                                        arcRendererDecorators: [
                                          charts.ArcLabelDecorator()
                                        ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Cantidad por productos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _MyDialogProducts(
                                              products: dataProducts,
                                              selectedProducts: dataProducts2,
                                              onSelectedProductsListChanged:
                                                  (cities) {
                                                setState(() {
                                                  dataProducts2 = cities;
                                                });
                                               
                                              });
                                        });
                                  },
                                  child: Text('Elegir Productos')),
                              Container(
                                width: size.width,
                                height:
                                    size.height * (dataProducts2.length / 30),
                                child:  dataProducts2.length > 0
                                    ? charts.BarChart(
                                        _dataProductsCant(),
                                        vertical: false,
                                        animate: true,
                                        barRendererDecorator:
                                            charts.BarLabelDecorator<String>(),
                                        domainAxis: charts.OrdinalAxisSpec(
                                            renderSpec:
                                                charts.NoneRenderSpec()),
                                      )
                                    : Text('Seleccione algun producto'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TimeChart(
                        seriesList: _dataDeliveriesAfterHours(),
                        height: size.height * 0.3,
                        title: 'Pedidos fuera del horario',
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      BarChart(
                        seriesList: _dataPedidosDiaVal(),
                        height: size.height * (data.length / 20),
                        title: 'Valor de pedidos por dia',
                        button: false,
                      ),
                      TimeChart(
                        seriesList: _dataPedidosDiaValTime(),
                        height: size.height * 0.3,
                        title: 'Cantidad de pedidos',
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Valor de pedidos por tienda',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _MyDialog(
                                              shatblisments: dataPedidosTienda,
                                              selectedStablishments:
                                                  dataPedidosTiendaSelected,
                                              onSelectedStablishmentsListChanged:
                                                  (cities) {
                                                setState(() {
                                                  dataPedidosTiendaSelected =
                                                      cities;
                                                });
                                                
                                              });
                                        });
                                  },
                                  child: Text('Elegir establecimientos')),
                              Container(
                                width: size.width,
                                height: size.height *
                                    (dataPedidosTiendaSelected.length / 30),
                                child:dataPedidosTiendaSelected.length > 0
                                    ? charts.BarChart(
                                        _dataPedidosTiendaVal(),
                                        vertical: false,
                                        animate: true,
                                        barRendererDecorator:
                                            charts.BarLabelDecorator<String>(),
                                        domainAxis: charts.OrdinalAxisSpec(
                                            renderSpec:
                                                charts.NoneRenderSpec()),
                                      )
                                    : Text('Seleccione algun establecimiento'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Cantidad de pedidos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: size.width,
                                height: size.height * 0.3,
                                child: charts.PieChart(_dataFranjasVal(),
                                    animate: true,
                                    defaultRenderer: charts.ArcRendererConfig(
                                        arcWidth: 30,
                                        arcRendererDecorators: [
                                          charts.ArcLabelDecorator()
                                        ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Valor por productos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return _MyDialogProducts(
                                              products: dataProducts,
                                              selectedProducts: dataProducts2,
                                              onSelectedProductsListChanged:
                                                  (cities) {
                                                setState(() {
                                                  dataProducts2 = cities;
                                                });
                                             
                                              });
                                        });
                                  },
                                  child: Text('Elegir Productos')),
                              Container(
                                width: size.width,
                                height:
                                    size.height * (dataProducts2.length / 30),
                                child:  dataProducts2.length > 0
                                    ? charts.BarChart(
                                        _dataProductsVal(),
                                        vertical: false,
                                        animate: true,
                                        barRendererDecorator:
                                            charts.BarLabelDecorator<String>(),
                                        domainAxis: charts.OrdinalAxisSpec(
                                            renderSpec:
                                                charts.NoneRenderSpec()),
                                      )
                                    : Text('Seleccione algun producto'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      BarChart(
                        seriesList: _dataTicket(),
                        height: size.height * (data.length / 20),
                        title: 'Ticket Promedio por dia',
                        button: false,
                      ),
                      BarChart(
                        seriesList: _dataTicketStore(),
                        height: size.height * 0.4,
                        title: 'Ticket Promedio por tienda',
                        button: false,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyDialog extends StatefulWidget {
  _MyDialog({
    this.shatblisments,
    this.selectedStablishments,
    this.onSelectedStablishmentsListChanged,
  });

  final List<PedidosTienda> shatblisments;
  final List<PedidosTienda> selectedStablishments;
  final ValueChanged<List<PedidosTienda>> onSelectedStablishmentsListChanged;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  List<PedidosTienda> _tempSelectedStablishments = [];

  @override
  void initState() {
    _tempSelectedStablishments = widget.selectedStablishments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: <Widget>[
          Text(
            'Tiendas',
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.shatblisments.length,
                itemBuilder: (BuildContext context, int index) {
                  final stablishmentName = widget.shatblisments[index];
                  return Container(
                    child: CheckboxListTile(
                        title: Text(stablishmentName.shop),
                        value: _tempSelectedStablishments
                            .contains(stablishmentName),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedStablishments
                                .contains(stablishmentName)) {
                              setState(() {
                                _tempSelectedStablishments
                                    .add(stablishmentName);
                              });
                            }
                          } else {
                            if (_tempSelectedStablishments
                                .contains(stablishmentName)) {
                              setState(() {
                                _tempSelectedStablishments.removeWhere(
                                    (PedidosTienda stablishment) =>
                                        stablishment == stablishmentName);
                              });
                            }
                          }
                          widget.onSelectedStablishmentsListChanged(
                              _tempSelectedStablishments);
                        }),
                  );
                }),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyDialogProducts extends StatefulWidget {
  _MyDialogProducts({
    this.products,
    this.selectedProducts,
    this.onSelectedProductsListChanged,
  });

  final List<PopularProducts> products;
  final List<PopularProducts> selectedProducts;
  final ValueChanged<List<PopularProducts>> onSelectedProductsListChanged;

  @override
  _MyDialogProductsState createState() => _MyDialogProductsState();
}

class _MyDialogProductsState extends State<_MyDialogProducts> {
  List<PopularProducts> _tempSelectedProducts = [];

  @override
  void initState() {
    _tempSelectedProducts = widget.selectedProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: <Widget>[
          Text(
            'Tiendas',
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final stablishmentName = widget.products[index];
                  return Container(
                    child: CheckboxListTile(
                        title: Text(stablishmentName.prod),
                        value: _tempSelectedProducts.contains(stablishmentName),
                        onChanged: (bool value) {
                          if (value) {
                            if (!_tempSelectedProducts
                                .contains(stablishmentName)) {
                              setState(() {
                                _tempSelectedProducts.add(stablishmentName);
                              });
                            }
                          } else {
                            if (_tempSelectedProducts
                                .contains(stablishmentName)) {
                              setState(() {
                                _tempSelectedProducts.removeWhere(
                                    (PopularProducts stablishment) =>
                                        stablishment == stablishmentName);
                              });
                            }
                          }
                          widget.onSelectedProductsListChanged(
                              _tempSelectedProducts);
                        }),
                  );
                }),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.red,
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}