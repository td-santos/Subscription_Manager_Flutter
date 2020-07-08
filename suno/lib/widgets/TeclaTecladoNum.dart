import 'package:flutter/material.dart';

class TeclaTecladoNum extends StatelessWidget {

  final String textoTecla;
  final bool colorRed;

  const TeclaTecladoNum({Key key, this.textoTecla, this.colorRed= false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
                    width: width * 0.1,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: colorRed == true ?Colors.red[300]:null,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.3, color: Colors.grey)),
                    child: Center(child: Text(textoTecla)));
  }
}