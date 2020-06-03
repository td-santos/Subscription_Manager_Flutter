import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Info",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 5),
              child: Text("Nome",style: TextStyle(
                fontSize: 20
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Text("Suno - Gestor de Assinaturas",style: TextStyle(
                fontSize: 20
              ),),
            ),
            Divider(color: Colors.grey,),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
              child: Text("Versão do App",style: TextStyle(
                fontSize: 20
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Text("1.0.0",style: TextStyle(
                fontSize: 20
              ),),
            ),
            Divider(color: Colors.grey,),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
              child: Text("Sobre",style: TextStyle(
                fontSize: 20
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Text("Aplicativo de gerenciamento financeiro focado em gestão de assinaturas contratadas.",style: TextStyle(
                fontSize: 20
              ),),
            ),
            Divider(color: Colors.grey,),
          ],
        ),
      )),
    );
  }
}
