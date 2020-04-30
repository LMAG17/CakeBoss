import 'dart:convert';

import 'package:flutter/material.dart';

class Login {
    String token;
    Establishment establishment;
    User user;

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
