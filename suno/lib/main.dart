import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:suno/screens/Home.dart';
import 'package:suno/screens/InitialPage.dart';
import 'package:suno/screens/MySplash.dart';



void main() {
  runApp(MaterialApp(

    localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('pt', 'BR'),
    const Locale('en', 'US'),
  ],
  locale: Locale('pt'),
    
    home: MySplash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      
      brightness: Brightness.dark,
      accentColor: Colors.deepPurple[600]
    ),
  ));
}

