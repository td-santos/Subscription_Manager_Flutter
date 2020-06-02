import 'package:flutter/material.dart';
import 'package:suno/screens/Home.dart';


void main() {
  runApp(MaterialApp(
    //home: Home(),
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.amber[700]
    ),
  ));
}

