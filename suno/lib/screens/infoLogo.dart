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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Serviços disponibilizados",
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
      body: ListView.builder(
                  itemCount: mapLogos.length,
                  /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),*/
                  itemBuilder: (context, index){
                    return CardServiceInfo(
                      nomeServico: mapLogos[index].keys.toString().replaceAll("(", "").replaceAll(")", ""),
                      urlLogo: mapLogos[index].values.toString().replaceAll("(", "").replaceAll(")", ""),
                    )
                    /*Container(
                      padding: EdgeInsets.all(20),
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(mapLogos[index].keys.toString().replaceAll("(", "").replaceAll(")", "")),
                          Image.asset(mapLogos[index].values.toString().replaceAll("(", "").replaceAll(")", ""),height: 30,width: 30,),
                          

                        ],
                      ),
                    )*/
                    ;
                  })
    );
  }
}