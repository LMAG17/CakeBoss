import 'dart:convert';

import 'package:cakeboss/backend/data/dataModel.dart';

import 'factory.dart';

class ServiceInteractor extends ServiceFactory {
  Future<Login> loginPost(Credentials send) async {
    try {
      String output = await handleMethod(
          'POST', '$serverPrimary$routeBasePrimary$routeAuthLogin',
          send: send.toRawJson());
      var object = Login.fromJson(json.decode(output));
      // print(object);
      return object;
    } catch (e) {
      print(e);
    }
  }
  Future<Login> logoutDelete(String send) async {
    try {
      String output = await handleMethod(
          'DELETE', '$serverPrimary$routeBasePrimary$routeAuthLogin',
          send: send);
      var object = Login.fromJson(json.decode(output));
      // print(object);
      return object;
    } catch (e) {
      print(e);
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
