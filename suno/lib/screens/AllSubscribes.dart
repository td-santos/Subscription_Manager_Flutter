import 'package:flutter/material.dart';
import 'package:suno/controles/AssinaturaDB.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/widgets/CardAssinatura.dart';
import 'package:suno/widgets/CardAssinaturaInfo.dart';

class AllSubscribes extends StatefulWidget {
  @override
  _AllSubscribesState createState() => _AllSubscribesState();
}

class _AllSubscribesState extends State<AllSubscribes> {

  AssinaturaDB assDB = AssinaturaDB();
  List<Assinatura> listaAssinaturas = List();

  _allSubs() {
    assDB.getAllAssinaturas().then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listaAssinaturas = list;
        });
        
      } else {
        setState(() {
          listaAssinaturas.clear();
          
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    _allSubs();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: (Text("All Subscribes!",style: TextStyle(color: Colors.grey),)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
            
              Expanded(
                //height: height,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: listaAssinaturas.length,
                  itemBuilder: (context, index) {
                    Assinatura ass = listaAssinaturas[index];
                    return CardAssinaturaInfo(
                      assinatura: ass,                      
                    );
                  }),
              ),
            
          ],
        ),
      ),
      
    );
  }
}