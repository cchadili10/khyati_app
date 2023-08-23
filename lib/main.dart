import 'package:flutter/material.dart';
import 'package:khyati_app/pages/fill.dart';
import 'package:khyati_app/pages/home.dart';
import 'package:khyati_app/pages/show.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/fill': (context) => Fill(),
    '/show': (context) => Show(),
  }));
}
