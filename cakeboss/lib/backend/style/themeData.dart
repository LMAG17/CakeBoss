import 'package:flutter/material.dart';

ThemeData d1() {
  return ThemeData(
      backgroundColor: Color.fromRGBO(145, 145, 145, 0.1),
      //primaryColor: Color.fromRGBO(231, 63, 100, 1),
      primaryColor: Color.fromRGBO(213, 0, 039, 1),
      buttonColor: Color.fromRGBO(213, 0, 039, 1),
      
      appBarTheme: AppBarTheme(
        color: Color.fromRGBO(213, 0, 039, 1),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          fontFamily: 'ondo-demo-medium',
          fontSize: 25,
          color: Colors.white,
        ),
        body1: TextStyle(
          fontFamily: 'montserrat-thin',
          fontSize: 20,
          color: Colors.black,
        ),
        body2: TextStyle(
          fontFamily: 'montserrat-bold',
          fontSize: 20,
          color: Colors.white,
        ),
        caption: TextStyle(
          // fontSize: 20,
          color: Colors.white,
        ),
        display1:  TextStyle(
          // fontSize: 20,
          color: Colors.black,
        ),
      ));
}

ThemeData exito() {
  return ThemeData(
      backgroundColor: Color.fromRGBO(145, 145, 145, 0.1),
      //primaryColor: Color.fromRGBO(231, 63, 100, 1),
      primaryColor: Colors.yellow,
      buttonColor: Colors.yellow,
      appBarTheme: AppBarTheme(
        color: Colors.yellow,
        textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          fontFamily: 'ondo-demo-medium',
          fontSize: 25,
          color: Colors.white,
        ),
        body1: TextStyle(
          fontFamily: 'montserrat-thin',
          fontSize: 20,
          color: Colors.black,
        ),
        body2: TextStyle(
          fontFamily: 'montserrat-bold',
          fontSize: 20,
          color: Colors.white,
        ),
        caption: TextStyle(
          color: Colors.black,
        ),
      ));
}