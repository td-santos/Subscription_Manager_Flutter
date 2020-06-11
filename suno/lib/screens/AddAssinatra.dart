import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:suno/controles/ControleBanco.dart';
import 'package:suno/widgets/ContainerOption.dart';
import 'package:suno/widgets/DialogLogos.dart';

import 'LogoScreen.dart';

class AddAssinatura extends StatefulWidget {
  @override
  _AddAssinaturaState createState() => _AddAssinaturaState();
}

class _AddAssinaturaState extends State<AddAssinatura> {
  double valueSlide;
  double valor;
  bool planB, planP, planPr = false;
  bool recU, recM, recA = false;
  String urlLogo;
  IconData iconSelecionado;
  DateFormat format_ddMMyyy = DateFormat("dd/MM/yyyy");
  DateFormat format_dd = DateFormat("dd");
  DateFormat format_MM = DateFormat("MM");
  DateFormat format_yyyy = DateFormat("yyyy");
  String dataInicioPG;
  String plano, recorrencia;
  TextEditingController _controllerAssinatura = TextEditingController();
  TextEditingController _controllerDesc = TextEditingController();
  TextEditingController _controllerNota = TextEditingController();
  TextEditingController _controllerMetPG = TextEditingController();
  int dia, mes, ano;
  Color cinzaEscuro2 = Color(0xff2E3035);

  salvar() {
    dia = int.parse(format_dd.format(DateTime.now()));
    mes = int.parse(format_MM.format(DateTime.now()));
    ano = int.parse(format_yyyy.format(DateTime.now()));
    valor = double.parse(valueSlide.toStringAsFixed(2).toString());

    ControleBanco cb = ControleBanco();
    cb.salvarDB(
        context,
        _controllerAssinatura.text,
        plano,
        recorrencia,
        valor,
        urlLogo,
        _controllerNota.text,
        dataInicioPG,
        _controllerMetPG.text,
        _controllerDesc.text,
        dia,
        mes,
        ano);
  }

  showDialogLogos() {
    showDialog(
        context: context,
        builder: (context) {
          return DiaogLogos();
        }).then((value) {
      print(value);
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          urlLogo = value;
        });
      });
    });
  }

  selectDate() async {
    final dataPicker = await showDatePicker(
      locale: Locale("pt", "BR"),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (dataPicker != null) {
      setState(() {
        dataInicioPG = format_ddMMyyy.format(dataPicker);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueSlide = 0;
    dataInicioPG = format_ddMMyyy.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      //backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  salvar();
                },
                child: Container(
                  height: height * 0.03, 
                  width: width * 0.17,
                  //padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue, Colors.purple[600]
                          ]),
                      //color: Colors.amber[700],
                      borderRadius: BorderRadius.circular(width * 0.025)),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white,fontSize: width * 0.03),
                    ),
                  ),
                ),
              ),
              Container(
                width: width * 0.03,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          color: Colors.black,
          /*decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey[900], Colors.black]),
          ),*/
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03, bottom: height * 0.02, top: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                container1(width, height),
                SizedBox(
                  height: height* 0.03,
                ),
                container2(width, height),
                Container(
                  //color: Colors.yellow,
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget container1(double width, double heigth) {
    return Container(
      padding: EdgeInsets.only(top: heigth * 0.03, left: width * 0.04, right: width * 0.04, bottom: heigth * 0.03),
      decoration: BoxDecoration(
        color: Colors.grey[900].withAlpha(150),
          /*gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [cinzaEscuro2, Colors.grey[900]]),*/
          //color: Colors.grey[850],
          borderRadius: BorderRadius.circular(width * 0.04)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(                  
                  controller: _controllerAssinatura,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(width * 0.04),
                      hintText: "Assinatura",
                      hintStyle: TextStyle(
                        fontSize: width * 0.033
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.04),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogoScreen())).then((value) {
                      print(value);
                      setState(() {
                        urlLogo = value;
                      });
                    });
                    //showDialogLogos();
                  },
                  child: Container(
                    height: width * 0.12,//45
                    width: width * 0.12,
                    decoration: BoxDecoration(
                        //color: Colors.amber[700],
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue, Colors.purple[600]
                              //Colors.deepPurple[300],
                              //Colors.deepPurple[600]
                            ]),
                        //border: Border.all(color: Colors.amber[700]),
                        borderRadius: BorderRadius.circular(width * 0.04),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-3, 3),
                              blurRadius: 7,
                              color: Colors.grey[900])
                        ]),
                    child: urlLogo == null
                        ? Icon(
                            iconSelecionado == null
                                ? Icons.style
                                : iconSelecionado,
                            color: Colors.white.withAlpha(90),//Colors.grey[850],
                            size: width * 0.07,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              urlLogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: <Widget>[
              Text("Plano: ",
              style: TextStyle(
                fontSize: width * 0.033
              ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    planP = false;
                    planPr = false;
                    planB = true;
                    plano = "Básico";
                  });
                },
                child: ContainerOption(
                  selected: planB,
                  texto: "Básico",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    planP = true;
                    planPr = false;
                    planB = false;
                    plano = "Padrao";
                  });
                },
                child: ContainerOption(
                  selected: planP,
                  texto: "Padrão",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    planP = false;
                    planPr = true;
                    planB = false;
                    plano = "Premium";
                  });
                },
                child: ContainerOption(
                  selected: planPr,
                  texto: "Premium",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: <Widget>[
              Text("Recorrência: ",
              style: TextStyle(
                fontSize: width * 0.033
              ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    recU = true;
                    recM = false;
                    recA = false;
                    recorrencia = "unica";
                  });
                },
                child: ContainerOption(
                  selected: recU,
                  texto: "Única",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    recU = false;
                    recM = true;
                    recA = false;
                    recorrencia = "mensal";
                  });
                },
                child: ContainerOption(
                  selected: recM,
                  texto: "Mensal",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    recU = false;
                    recM = false;
                    recA = true;
                    recorrencia = "anual";
                  });
                },
                child: ContainerOption(
                  selected: recA,
                  texto: "Anual",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: _controllerNota,
            maxLines: 2,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(width * 0.04),
                hintText: "Nota (opicional)",
                hintStyle: TextStyle(
                        fontSize: width * 0.033
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.04),
                )),
          ),
        ],
      ),
    );
  }

  Widget container2(double width, double height) {
    return Container(
      padding: EdgeInsets.only(top: height * 0.03, left: width * 0.04, right: width * 0.04, bottom: height * 0.03),
      decoration: BoxDecoration(
        color:Colors.grey[900].withAlpha(150),
          /*gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [cinzaEscuro2, Colors.grey[900]]),*/
          //color: Colors.grey[850],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.black,
                /*gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.black, Colors.grey[900]]),*/
                //color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${valueSlide.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: width * 0.07),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: width * 0.5,
                              //color: Colors.blue,
                              child: Slider(                              
                              //activeColor: Colors.amber[700],
                              activeColor: Colors.deepPurple[300],
                              max: 200,
                              value: valueSlide,
                              onChanged: (value) {
                                setState(() {
                                  valueSlide = value;
                                });
                              },
                            )
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Primeiro pagamento:  ",
                          style: TextStyle(
                            fontSize: width * 0.033,
                            color: Colors.white.withAlpha(80)),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              dataInicioPG,
                              style: TextStyle(
                                  fontSize: width * 0.04,//17,
                                  color: Colors.white.withAlpha(170),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                selectDate();
                              },
                              child: Icon(
                                FontAwesomeIcons.calendarAlt,size: width * 0.05,
                                //Icons.edit,
                                color: Colors.white.withAlpha(170),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: _controllerMetPG,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(width * 0.04),
                hintText: "Método de pagamento  (opicional)",
                hintStyle: TextStyle(
                        fontSize: width * 0.033
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.04),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _controllerDesc,
            maxLines: 4,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(width * 0.04),
                hintText: "Descriçao (opicional)",
                hintStyle: TextStyle(
                        fontSize: width * 0.033
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.04),
                )),
          ),
        ],
      ),
    );
  }
}
