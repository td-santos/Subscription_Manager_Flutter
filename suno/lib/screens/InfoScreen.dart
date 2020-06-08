import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  Color cinzaEscuro2 = Color(0xff2E3035);

  Future<void> openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        //backgroundColor: Colors.grey[900],
        /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Info",
            style: TextStyle(
              fontSize: width * 0.07,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),*/
        body: Container(
        height: height,
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [cinzaEscuro2, Colors.grey[900]]),
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 40,bottom: 15),
                child: Row(                  
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(                      
                      child: Text(
                        "Info",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: 20,
                    bottom: 5),
                child: Text(
                  "Nome",
                  style: TextStyle(fontSize: width * 0.03),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05, right: width * 0.05, bottom: 10),
                child: Text(
                  "Suno - Gestor de Assinaturas",
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: 10,
                    bottom: 5),
                child: Text(
                  "Versão do App",
                  style: TextStyle(fontSize: width * 0.03),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05, right: width * 0.05, bottom: 10),
                child: Text(
                  "1.0.0",
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: 10,
                    bottom: 5),
                child: Text(
                  "Sobre",
                  style: TextStyle(fontSize: width * 0.03),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05, right: width * 0.05, bottom: 10),
                child: Text(
                  "Aplicativo de gerenciamento financeiro focado em gestão de assinaturas contratadas.",
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    bottom: 10,
                    top: 30),
                child: GestureDetector(
                  onTap: () {
                    String url =
                        'https://play.google.com/store/apps/collection/cluster?clp=igM4ChkKEzYxMzI1MDQ2Mzg0NDA4MzQxNzQQCBgDEhkKEzYxMzI1MDQ2Mzg0NDA4MzQxNzQQCBgDGAA%3D:S:ANO1ljL28v4&gsr=CjuKAzgKGQoTNjEzMjUwNDYzODQ0MDgzNDE3NBAIGAMSGQoTNjEzMjUwNDYzODQ0MDgzNDE3NBAIGAMYAA%3D%3D:S:ANO1ljIEZ0Q';
                    openURL(url);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Conheça nossos apps !",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
