import 'dart:convert';

import 'package:cakeboss/backend/data/dataModel.dart';

import 'factory.dart';

class ServiceInteractor extends ServiceFactory {
  Future<Login> loginPost(Credentials send) async {
    try {
      String output = await handleMethod(
          'POST', '$serverPrimary$routeBasePrimary$routeAuthLogin',
          send: send.toRawJson());
      Login object = Login.fromJson(json.decode(output));
      // print(object);
      return object;
    } catch (e) {
      throw(e);
    }
  }
  Future<Login> logoutDelete(String send) async {
    try {
      String output = await handleMethod(
          'DELETE', '$serverPrimary$routeBasePrimary$routeAuthLogin',
          send: send);
      Login object = Login.fromJson(json.decode(output));
      // print(object);
      return object;
    } catch (e) {
      throw(e);
    }
  }
  Future<List<List>> fetchData(Login establishment)async{
    
    try {
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
      List<charts.Series>data=[charts.Series<PedidosDia, String>(
              id: 'Pedidos dia',
              data: dataPedidosDia,
              domainFn: (PedidosDia pedido, __) =>
                  "Fecha: ${pedido.day.month}/${pedido.day.day} => Cant ",
              measureFn: (PedidosDia pedido, __) => pedido.amount,
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(
                  establishment.establishment.colors.primary.toColor()),
              labelAccessorFn: (PedidosDia pedido, _) =>
                  '${pedido.day.day}/${pedido.day.month}/${pedido.day.year}: ${pedido.amount}'))];
                  
  List<PedidosDia> data;

  List<TicketDay> dataTicket2;

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
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
              this.widget.login.establishment.colors.primary.toColor()),
          labelAccessorFn: (PedidosTienda pedido, _) =>
              '${pedido.shop}: ${formato.format(pedido.value)}')
    ];
  }

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
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(
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
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )
    ];
  }

  }
  // Future<Menu> getMenu(Establishment send) async {
  //   String arguments = '/${send.idEstablecimiento}' + '/${send.idSucursal}';

  //   String output = await handleMethod(
  //     'GET',
  //     '$serverPrimary$routeBasePrimary$routeMenu$arguments',
  //   );
  //   var object = Menu.fromJson(json.decode(output));
  //   return object;
  // }

  // static System system;
  // static Lock lock = Lock();

  // ServiceInteractor() {
  //   init();
  // }

  // init() async {
  //   await lock.synchronized(() async {
  //     if (system == null) system = await getSystem();
  //   });
  // }

  // Future<System> getSystem() async {
  //   String output = await handleMethod(
  //     'GET',
  //     '$serverPrimary$routeBasePrimary$routeSystem',
  //   );
  //   var object = System.fromJson(output);
  //   return object;
  // }

  // Future<Status> postUserAddress(int user, RequestAddress send) async {
  //   String output = await handleMethod(
  //     'POST',
  //     '$serverSecondary$routeBaseSecondary$routeUserAddresses/$user',
  //     send: send.toRawJson(),
  //   );
  //   var object = Status.fromJson(json.decode(output));
  //   return object;
  // }

  // Future<List<Address>> getUserAddresses(int user) async {
  //   String output = await handleMethod(
  //     'GET',
  //     '$serverSecondary$routeBaseSecondary$routeUserAddresses/$user',
  //   );
  //   if (output != null) {
  //     var list = Addresses.fromJson(json.decode(output)).user.directions.list;
  //     return list;
  //   } else {
  //     return null;
  //   }
  // }

  // Future<Status> putUserAddress(int user, int id, RequestAddress send) async {
  //   String output = await handleMethod(
  //     'PUT',
  //     '$serverSecondary$routeBaseSecondary$routeUserAddresses/$user/$id',
  //   );
  //   var object = Status.fromJson(json.decode(output));
  //   return object;
  // }

  // Future<Status> deleteUserAddress(int user, int id) async {
  //   String output = await handleMethod(
  //     'DELETE',
  //     '$serverSecondary$routeBaseSecondary$routeUserAddresses/$user/$id',
  //   );
  //   var object = Status.fromJson(json.decode(output));
  //   return object;
  // }

  // Future<Establishments> getEstablishments(RequestAddress send) async {
  //   String arguments = '/${send.service}' +
  //       '/${send.geo}' +
  //       '/${send.city}' +
  //       '/${send.typeRoad}' +
  //       '/${send.printipalRoad}' +
  //       '/${send.generatorRoad}' +
  //       '/${send.plate}' +
  //       '/U' + //'/${send.typeSearch}' +
  //       '/${send.zone}' +
  //       '/0' +
  //       '/10';

  //   String output = await handleMethod(
  //     'GET',
  //     '$serverSecondary$routeBaseSecondary$routeSearchServices$arguments',
  //   );
  //   var object = Establishments.fromJson(output);
  //   return object;
  // }

  // Future<Promos> getPromos() async {
  //   String list = base64.encode(utf8.encode('83-1,1-2'));

  //   String output = await handleMethod(
  //     'GET',
  //     '$serverSecondary$routeBaseSecondary$routePromos/$list',
  //   );
  //   var object = Promos.fromJson(json.decode(output));
  //   return object;
  // }

  // Future<Establishment> getEstablishment(Establishment send) async {
  //   String arguments = '/${send.idEstablecimiento}' + '/${send.idSucursal}';

  //   String output = await handleMethod(
  //     'GET',
  //     '$serverPrimary$routeBasePrimary$routeEstablishment$arguments',
  //   );
  //   var object = Establishment.fromJson(json.decode(output));
  //   return object;
  // }

  // Future<Article> getArticle(ListArticulo send) async {
  //   String arguments =
  //       '/${send.componerarticulo}' + '/${send.tamanocomponer}' + '/${send.idarticulo}' + '/${send.complementararticulo}' + '/${send.tieneOpcionales}';

  //   // 1, 13, 570, 5810
  //   String output = await handleMethod(
  //     'GET',
  //     '$serverPrimary$routeBasePrimary$routeArticle$arguments',
  //   );
  //   var object = Article.fromJson(output);
  //   return object;
  // }

  // Future<ConfirmaOrden> postSendOrder(Pedido send) async {
  //   send.datosCliente.token = "pruebadetoken";
  //   String sendJson = send.toJson();
  //   String output = await handleMethod(
  //     'POST',
  //     '$serverPrimary$routeBasePrimary$routeSendOrder',
  //     send: sendJson,
  //   );
  //   var object = ConfirmaOrden.fromJson(output);
  //   return object;
  // }
}
