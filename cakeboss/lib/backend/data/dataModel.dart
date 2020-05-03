import 'dart:convert';

import 'package:flutter/material.dart';

class Login {
    String token;
    Establishment establishment;
    User user;

  List<PedidosTienda> pedidosTienda = [
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
  List<PedidosDia> pedidosDia = [
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
  List<FranjaHor> franjas = [
    FranjaHor('Mañana', 232, 31203240),
    FranjaHor('Tarde', 595, 81817110),
  ];
  List<TicketDay> ticketDay = [
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
  List<TicketStore> ticketStore = [
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
  List<PopularProducts> prdoucts = [
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
  List<DeliveriesAfterHours> deliveryAfterHour = [
    DeliveriesAfterHours(DateTime.parse("2020-04-19"), 1),
    DeliveriesAfterHours(DateTime.parse("2020-04-20"), 1),
    DeliveriesAfterHours(DateTime.parse("2020-04-21"), 6),
    DeliveriesAfterHours(DateTime.parse("2020-04-22"), 1),
  ];
  
    Login({
        this.token,
        this.establishment,
        this.user,
    });

    factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"] == null ? null : json["token"],
        establishment: json["establishment"] == null ? null : Establishment.fromJson(json["establishment"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "establishment": establishment == null ? null : establishment.toJson(),
        "user": user == null ? null : user.toJson(),
    };
}

class Establishment {
    int id;
    String name;
    Colorss colors;

    Establishment({
        this.id,
        this.name,
        this.colors,
    });

    factory Establishment.fromRawJson(String str) => Establishment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Establishment.fromJson(Map<String, dynamic> json) => Establishment(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        colors: json["colors"] == null ? null : Colorss.fromJson(json["colors"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "colors": colors == null ? null : colors.toJson(),
    };
}

class Colorss {
    String primary;
    String secondary;

    Colorss({
        this.primary,
        this.secondary,
    });

    factory Colorss.fromRawJson(String str) => Colorss.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Colorss.fromJson(Map<String, dynamic> json) => Colorss(
        primary: json["primary"] == null ? null : json["primary"],
        secondary: json["secondary"] == null ? null : json["secondary"],
    );

    Map<String, dynamic> toJson() => {
        "primary": primary == null ? null : primary,
        "secondary": secondary == null ? null : secondary,
    };
}

class User {
    String name;

    User({
        this.name,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
    };
}

class PedidosDia {
  final DateTime day;
  final int amount;
  final int value;

  PedidosDia(this.day, this.amount, this.value);
}

class PedidosTienda {
  final String shop;
  final int amount;
  final int value;

  PedidosTienda(this.shop, this.amount, this.value);
}

class FranjaHor {
  final String tipo;
  final int amount;
  final int value;

  FranjaHor(this.tipo, this.amount, this.value);
}

class TicketDay {
  final DateTime day;
  final int value;

  TicketDay(this.day, this.value);
}

class TicketStore {
  final String shop;
  final int value;

  TicketStore(this.shop, this.value);
}
class PopularProducts {
  final String prod;
  final int amount;
  final int value;

  PopularProducts(this.prod, this.amount, this.value);
}

class DeliveriesAfterHours {
  final DateTime day;
  final int value;

  DeliveriesAfterHours(this.day, this.value);
}
class Credentials {
    String user;
    String password;

    Credentials({
        @required this.user,
        @required this.password,
    });

    factory Credentials.fromRawJson(String str) => Credentials.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        user: json["user"] == null ? null : json["user"],
        password: json["password"] == null ? null : json["password"],
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? null : user,
        "password": password == null ? null : password,
    };
}
