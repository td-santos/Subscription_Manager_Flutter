import 'package:flutter/material.dart';
import 'package:suno/screens/Home.dart';
import 'package:suno/widgets/AppDrawer.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  List<Widget> telas = [Home()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: telas[0],
    );
  }
}