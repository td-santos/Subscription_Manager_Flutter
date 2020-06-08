import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suno/model/Listas.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  Color cinzaEscuro2 = Color(0xff2E3035);
  Color cinzaEscuro = Color(0xff383844);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Logos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.07,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 0, top: 30),
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[900],
                    Colors.grey[900],
                    Colors.grey[850]
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _listagemLogosWidget(width * 0.05, height * 0.3, "Music", mapLogoMusic),
                _listagemLogosWidget( width * 0.05, height * 0.3, "Stream Video", mapLogoVideo),
                _listagemLogosWidget(width * 0.05, height * 0.2, "Games", mapLogoGames),
                _listagemLogosWidget(width * 0.05, height * 0.2, "Design", mapLogoDesign),
                _listagemLogosWidget(width * 0.05, height * 0.2, "Outros", mapLogoOutros),
                SizedBox(height: height * 0.1)
              ],
            ),
          ),
        ),
      );
  }
}

Widget _listagemLogosWidget(
    double width, double height, String categoria, Map listaLogos) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 0),
        child: Text(
          "$categoria",
          style: TextStyle(fontSize: width, fontWeight: FontWeight.w200),
        ),
      ),
      Container(
        height: height,
        //color: Colors.black,
        //width: 400,
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: listaLogos.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, listaLogos[index]);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(offset: Offset(-3, 3), blurRadius: 4)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    listaLogos[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      )
    ],
  );
}
