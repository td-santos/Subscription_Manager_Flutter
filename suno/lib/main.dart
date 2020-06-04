import 'package:flutter/material.dart';
import 'package:suno/screens/Home.dart';
import 'package:suno/screens/InitialPage.dart';
import 'package:suno/screens/MySplash.dart';



void main() {
  runApp(MaterialApp(

    
    
    home: MySplash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.amber[700]
    ),
  ));
}

