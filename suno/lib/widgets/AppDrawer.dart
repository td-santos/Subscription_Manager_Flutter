import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:suno/controles/AssinaturaDB.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/screens/DetalheAssinatura.dart';
import 'package:suno/screens/InfoScreen.dart';

import 'CardItemList.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  AssinaturaDB assDB = AssinaturaDB();
  List<Assinatura> listaAssinaturas = List();
  var total;
  String totalAssinaturas = "";
  DateFormat format_MM = DateFormat("MM");
  DateFormat format_yyyy = DateFormat("yyyy");
  var dataAtual = new DateTime.now();
  int proximoMes;
  bool visible = false;

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _allMovValor(String data) {
    assDB.getAllAssinaturasPorMes(data).then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listaAssinaturas = list;
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
  Widget build(BuildContext context) {
    proximoMes = int.parse(format_MM.format(dataAtual)) + 1;
    if (proximoMes > 12) {
      proximoMes = 1;
    }
    if (proximoMes < 10) {
      _allMovValor("0$proximoMes/${format_yyyy.format(dataAtual)}");
    } else {
      _allMovValor("$proximoMes/${format_yyyy.format(dataAtual)}");
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
               //color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey[900],Colors.grey[850],]
                )
            ),
            width: width,
            height: height * 0.25,
           
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "    Suno",
                style: TextStyle(
                  fontSize: 60, 
                  color: Colors.grey,
                  fontFamily: "Stentiga",
                  fontWeight: FontWeight.w200
                  ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.grey[900],
                gradient: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                colors: [Colors.grey[900],Colors.grey[850],]
                )
                //image: DecorationImage(
                //  image: NetworkImage("https://colorindonuvens.com/wp-content/uploads/2020/03/Wallpaper4k-Preto-ColorindoNuvens-6.jpg"),
                //  fit: BoxFit.cover,
                //  )
              ),
              width: width,
              height: height * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, top: 20, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.dollarSign,
                                  color: Colors.orange[700],
                                ),
                                Text(
                                  " Proximo mês: ",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 6),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5,color: Colors.orange[700]),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                "$totalAssinaturas",
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, top: 20, right: 20, bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.database,
                                color: Colors.orange[700],
                              ),
                              Text(
                                " Assinaturas cadastradas",
                                style: TextStyle(fontSize: 15),
                              ),
                              //Text("2000.00")
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      AnimatedSize(
                        reverseDuration: Duration(milliseconds: 300),
                        duration: Duration(milliseconds: 200),
                        vsync: this,
                        child: Container(
                          //duration: Duration(milliseconds: 300),
                          height: visible == false ? 0 : 400,
                          child: ListView.builder(
                              itemCount: listaAssinaturas.length,
                              itemBuilder: (context, index) {
                                Assinatura ass = listaAssinaturas[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetalheAssinatura(
                                                    id: ass.id,
                                                    urlImage: ass.urlLogo,
                                                    valor: ass.valor.toString(),
                                                    nome: ass.assinaturaName,
                                                    plano: ass.plano,
                                                    recorrencia:
                                                        ass.recorrencia,
                                                    nota: ass.nota,
                                                    metodoPG: ass.metodoPG,
                                                    descricao: ass.descricao,
                                                    data: ass.data)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 45,
                                          width: 45,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.asset(
                                              ass.urlLogo,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "${ass.assinaturaName}",
                                                style: TextStyle(fontSize: 17),
                                              ),
                                              Text("${ass.valor}"),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                                
                         
                              }),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, bottom: 40, right: 20, top: 20),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> InfoScreen()
                              ));
                          },
                          child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.info,
                              color: Colors.orange[700],
                            ),
                            Text(
                              " Sobre",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
