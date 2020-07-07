import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suno/controles/AssinaturaDB.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/widgets/CardAssinatura.dart';
import 'AddAssinatra.dart';

class Home extends StatefulWidget {
  final String userName;

  const Home({Key key, this.userName}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AssinaturaDB assDB = AssinaturaDB();
  List<Assinatura> listaAssinaturas = List();
  List<Assinatura> listaAssinaturasProxMes = List();
  List<Assinatura> listaAssinaturasMesCorrente = List();
  //List<Assinatura> listaTeste = List();
  String userName = "";
  TextEditingController _controllerNomeUser = TextEditingController();
  
  var total;
  double totalProxMes;
  var formatMMyyyy = DateFormat("MM/yyyy");
  var dataAtual = new DateTime.now();
  String totalAssinaturas = "";
  String totalAssinaturasProxMes = "";
  //ControleBanco cb = ControleBanco();
  //DateFormat format_dd = DateFormat("dd");
  DateFormat format_MM = DateFormat("MM");
  DateFormat format_yyyy = DateFormat("yyyy");
  DateFormat format_Mes = DateFormat("MMMM", "pt_BR");
  DateFormat formatFullData = DateFormat("MMMM 'de' yyyy", "pt_BR");
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int proximoMes;
  String mesSeguinte = "";
  bool visibleFundo= false;

  salvarNamePrefs(String name) async {    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userName", "Hi, $name");
    
    setState(() {
      userName = name;
    });
    print("(SalvarPrefs Name):$name "); 
    print(prefs.getString("userName"));   

    getNamePrefs();
  }

  getNamePrefs()async{
    final prefs = await SharedPreferences.getInstance();
    
    setState(() {
      userName = prefs.getString("userName");
      print(userName);
      print(prefs.getString("userName"));  
    });

    if(userName == null || userName.isEmpty){
      setState(() {
        userName = "Change Name Here";
      });      
    }    
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 2 : 2).replaceAll(".", ",");
  }

  _allAssinaturasPorMes(String data) {
    assDB.getAllAssinaturasPorMes(data).then((list) {
    
      listaAssinaturasMesCorrente.clear();

      if (list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Assinatura ass = list[i];
          int mesAssintura = int.parse(ass.data.substring(3, 5));
          int mesParametro = int.parse(data.substring(0, 2));
          int anoAssinatura = int.parse(ass.data.substring(6, 10));
          int anoParametro = int.parse(data.substring(3, 7));
          //print("ASS DATA: ${ass.data.substring(3,5)}");
          //print("DATA: ${data.substring(0,2)}");
          //print("ASS Ano: ${anoAss}");
          //print("DATA Ano: ${anoParam}");

          if (ass.recorrencia == 'mensal') {
            if (mesAssintura <= mesParametro) {
              if (anoAssinatura <= anoParametro) {
                listaAssinaturasMesCorrente.add(ass);
              }
            }
            if (mesAssintura >= mesParametro) {
              if (anoAssinatura < anoParametro) {
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
          
        });

        total =listaAssinaturas.map((item) => item.valor).reduce((a, b) => a + b);
        totalAssinaturas = format(total).toString();
        
      } else {
        setState(() {
          listaAssinaturas.clear();
          total = 0.00;
          visibleFundo = true;
          totalAssinaturas = format(total);
        });
      }
    });
  }

  _allAssinaturasProxMesValor(String data) {
    assDB.getAllAssinaturasPorMes(data).then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listaAssinaturasProxMes = list;
        });
        totalProxMes = listaAssinaturasProxMes
            .map((item) => item.valor)
            .reduce((a, b) => a + b);
        totalAssinaturasProxMes = format(totalProxMes).toString();
      } else {
        setState(() {
          listaAssinaturasProxMes.clear();
          totalProxMes = 0.00;
          totalAssinaturasProxMes = format(totalProxMes);
        });
      }
    });
  }

  showDialogName(width) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(width * 0.04)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.04, left:width * 0.03, right: width * 0.03),
                    child: Text("Ei, qual o seu nome?"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.03),
                    child: TextField(
                      onSubmitted: (text){
                        setState(() {
                          salvarNamePrefs(text);
                          //userName = text;
                        });
                        Navigator.pop(context);
                      },
                      maxLength: 15,
                      controller: _controllerNomeUser,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(width * 0.04),
                          hintText: "...",
                          hintStyle: TextStyle(fontSize: width * 0.033),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.04),
                          )),
                    ),
                  ),
                  SizedBox(height: width * 0.05,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        salvarNamePrefs(_controllerNomeUser.text);
                        //userName = _controllerNomeUser.text;
                      });
                      Navigator.pop(context);
                    },
                                      child: Container(
                      width: width,
                      height: width * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width * 0.04),
                          bottomRight: Radius.circular(width * 0.04),
                        )
                        ),
                      child: Center(
                        child: Text("Save"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _calcProxMes(){
    proximoMes = int.parse(format_MM.format(dataAtual)) + 1;
    if (proximoMes > 12) {
      proximoMes = 1;
    }
    if (proximoMes < 10) {
      mesSeguinte =
          format_Mes.format(DateTime.parse("2000-0${proximoMes}-01 11:11:11"));
      _allAssinaturasProxMesValor("0$proximoMes/${format_yyyy.format(dataAtual)}");
    } else {
      mesSeguinte =
          format_Mes.format(DateTime.parse("2000-${proximoMes}-01 11:11:11"));
      _allAssinaturasProxMesValor("$proximoMes/${format_yyyy.format(dataAtual)}");
    }
  }
  
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    getNamePrefs();
    
  }

  @override
  Widget build(BuildContext context) {

    _calcProxMes();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _allAssinaturasPorMes(formatMMyyyy.format(dataAtual));

    return Scaffold(      
      key: _scaffoldKey,
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              showDialogName(width);
            },
            child: Text("$userName")),
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
      
      body: Container(
        color: Colors.black,
        height: height,
        child: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
              child: Container(
                padding:EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),                
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.03),
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

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(width * 0.02),
                          child: Text(
                            "${formatFullData.format(dataAtual)}",
                            style: TextStyle(fontSize: width * 0.03),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: width * 0.01,
                              bottom: width * 0.01,
                              left: width * 0.03,
                              right: width * 0.03),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 0.2),
                              borderRadius:
                                  BorderRadius.circular(width * 0.015)),
                          child: Center(
                            child: Text(
                              "${mesSeguinte}:  $totalAssinaturasProxMes",
                              style: TextStyle(fontSize: width * 0.03),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(width * 0.02),
                          child: Text(
                            "R\$",
                            style: TextStyle(
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                        Text(
                          "${totalAssinaturas.replaceAll(".", ",")}",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: width * 0.15,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
              child: listaAssinaturas.length == 0
              ?Visibility(
                visible: visibleFundo,
                child: Opacity( 
                  opacity: 0.7,
                  child: Container(                
                    child: Center(                  
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
                    return CardAssinatura(
                      assinatura: ass,                      
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
