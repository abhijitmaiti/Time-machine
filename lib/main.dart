import 'package:flutter/material.dart';
import 'package:time_machine/Loading.dart';
import 'Choose_location.dart';
import 'Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/loading',
    routes: {
      '/location': (context) => Chooselocation(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading()
    },
  ));
}
