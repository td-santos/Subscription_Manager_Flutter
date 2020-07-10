import 'package:flutter/material.dart';
import 'package:suno/model/Listas.dart';
import 'package:suno/widgets/CardServiceInfo.dart';

class InfoLogo extends StatefulWidget {
  @override
  _InfoLogoState createState() => _InfoLogoState();
}

class _InfoLogoState extends State<InfoLogo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;    

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Serviços",
              style: TextStyle(
                //fontSize: width * 0.05,
                color: Colors.grey
                //fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: mapLogos.length,
            itemBuilder: (context, index) {
              return CardServiceInfo(
                nomeServico: mapLogos[index].keys.toString().replaceAll("(", "").replaceAll(")", ""),
                urlLogo: mapLogos[index].values.toString().replaceAll("(", "").replaceAll(")", ""),
              );
            }));
  }
}
