import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  bool visibleFundo= false;

  _allSubs() {
    assDB.getAllAssinaturas().then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listaAssinaturas = list;
        });
        
      } else {
        setState(() {
          listaAssinaturas.clear();
          visibleFundo = true;
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
        centerTitle: false,
        title: (Text("Cadastrados",style: TextStyle(color: Colors.grey),)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
            
              Expanded(
                //height: height,
                child: listaAssinaturas.length == 0
                ?Visibility(
                visible: visibleFundo,
                child: Opacity( 
                opacity: 0.7,
                child: Container(                
                child: Center(
                  //child: Image.asset("assets/fundo/fundo2.png",fit: BoxFit.cover,),
                  //child: Icon(FontAwesomeIcons.cube,size: width * 0.5,color: Colors.grey[900], ),
                  child: Icon(FontAwesomeIcons.buffer,size: width * 0.7,color: Colors.grey[900], ),
                ),
              ),
              )
                )
                :ListView.builder(
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