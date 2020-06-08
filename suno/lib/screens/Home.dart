import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suno/controles/AssinaturaDB.dart';
import 'package:suno/controles/ControleBanco.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/widgets/AppDrawer.dart';
import 'package:suno/widgets/CardAssinatura.dart';
import 'package:suno/widgets/CardItemList.dart';
import 'AddAssinatra.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AssinaturaDB assDB = AssinaturaDB();
  List<Assinatura> listaAssinaturas = List();
  List<Assinatura> listaAssinaturasMesCorrente = List();
  List<Assinatura> listaTeste = List();

  //azulMarinho 0D3159

  var total;
  var formatMMyyyy = DateFormat("MM/yyyy");
  var dataAtual = new DateTime.now();
  String totalAssinaturas = "";
  ControleBanco cb = ControleBanco();
  DateFormat format_dd = DateFormat("dd");
  DateFormat format_MM = DateFormat("MM");
  DateFormat format_yyyy = DateFormat("yyyy");
  DateFormat format_Mes = DateFormat("MMMM", "pt_BR");
  DateFormat formatFullData = DateFormat("MMMM 'de' yyyy", "pt_BR");
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Color cinzaEscuro2 = Color(0xff2E3035);

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _allMovMes(String data) {
    assDB.getAllAssinaturasPorMes(data).then((list) {
      //print(list);
      listaAssinaturasMesCorrente.clear();

      if (list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Assinatura ass = list[i];
          int mesAss = int.parse(ass.data.substring(3, 5));
          int mesParam = int.parse(data.substring(0, 2));
          int anoAss = int.parse(ass.data.substring(6, 10));
          int anoParam = int.parse(data.substring(3, 7));
          //print("ASS DATA: ${ass.data.substring(3,5)}");
          //  print("DATA: ${data.substring(0,2)}");
          //print("ASS Ano: ${anoAss}");
          //print("DATA Ano: ${anoParam}");

          if (ass.recorrencia == 'mensal') {
            if (mesAss <= mesParam) {
              if (anoAss <= anoParam) {
                listaAssinaturasMesCorrente.add(ass);
              }
            }
            if (mesAss >= mesParam) {
              if (anoAss < anoParam) {
                listaAssinaturasMesCorrente.remove(ass);
                listaAssinaturasMesCorrente.add(ass);
              }
            }
          }
          if (ass.recorrencia == 'anual' || ass.recorrencia == 'unica') {
            listaAssinaturasMesCorrente.add(ass);
          }
        }
        setState(() {
          listaAssinaturas = listaAssinaturasMesCorrente;
          //listaAssinaturas = list;
        });

        total =
            listaAssinaturas.map((item) => item.valor).reduce((a, b) => a + b);
        totalAssinaturas = format(total).toString();
      } else {
        setState(() {
          listaAssinaturas.clear();
          total = 0;
          totalAssinaturas = total.toString();
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_allMovMes(formatMMyyyy.format(dataAtual));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _allMovMes(formatMMyyyy.format(dataAtual));

    return Scaffold(
      //backgroundColor: Colors.grey[900],
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Hi, Mike"),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: false,
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAssinatura()));
                },
                child: Icon(Icons.add),
              ),
              Container(
                width: 15,
              )
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.black]
              // colors: [cinzaEscuro2, Colors.grey[900]]
              ),
        ),
        height: height,
        child: Column(
          children: <Widget>[

            Padding(
              padding:EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
              child: Container(
                padding:EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
                //height: 100,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width *0.03),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.purple[600]],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withAlpha(80),
                        offset: Offset(0, 8),
                        blurRadius: 30,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(width *0.02),
                          child: Text(
                            "${formatFullData.format(dataAtual)}",
                            
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(width *0.02),
                          child: Text(
                            "R\$",
                            style: TextStyle(
                                fontSize: width * 0.07, fontWeight: FontWeight.w100),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${totalAssinaturas.replaceAll(".", ",")}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: width* 0.15, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            /*Container(
              
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue[400], Colors.deepPurple[600]]),
                 // color: Colors.deepPurple[200]
                 ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 50, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                          child: Icon(Icons.sort),
                        ),
                        Container(
                          //width: width,
                          child: Text("${format_Mes.format(dataAtual)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w100)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddAssinatura()));
                          },
                          child: Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      //height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Container(
                              //width: width,

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("R\$",
                                      style: TextStyle(
                                          //fontSize: 20,
                                          fontWeight: FontWeight.w100)),
                                  Text(
                                    "${totalAssinaturas.replaceAll(".", ",")}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 50,
                                        //color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            /*Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(Icons.sort),
                  ),
                  Container(
                    //width: width,
                    child: Text("Assinaturas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w100)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAssinatura()));
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
              child: Container(
                padding: EdgeInsets.all(20),
                //height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.deepPurple[300], Colors.deepPurple[600]],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        Text("${format_Mes.format(dataAtual)}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w100)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Container(
                        //width: width,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("R\$",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w100)),
                            Text(
                              "${totalAssinaturas.replaceAll(".", ",")}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Assinaturas",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    Icons.short_text,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: listaAssinaturas.length,
                  itemBuilder: (context, index) {
                    Assinatura ass = listaAssinaturas[index];
                    return CardAssinatura(
                      id: ass.id,
                      nome: ass.assinaturaName,
                      imagemUrl: ass.urlLogo,
                      valor: format(ass.valor), //ass.valor.toString(),
                      plano: ass.plano,
                      recorrencia: ass.recorrencia,
                      nota: ass.nota,
                      metodoPG: ass.metodoPG,
                      descricao: ass.descricao,
                      data: ass.data,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
