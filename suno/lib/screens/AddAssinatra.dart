import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:suno/controles/ControleBanco.dart';
import 'package:suno/widgets/ContainerOption.dart';
import 'package:suno/widgets/DialogLogos.dart';

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
  int dia,mes,ano;

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
        _controllerDesc.text,dia,mes,ano);
    
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
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Icon(FontAwesomeIcons.angleLeft),
                  //child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    salvar();
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: Colors.amber[700],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.grey[900]),
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: _controllerAssinatura,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Assinatura",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            showDialogLogos();
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.amber[700],
                                //border: Border.all(color: Colors.amber[700]),
                                borderRadius: BorderRadius.circular(15),
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
                                    color: Colors.grey[850],
                                    size: 30,
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
                      Text("Plano: "),
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
                      Text("Recorrência: "),
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
                        hintText: "Nota (opicional)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
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
                                  style: TextStyle(fontSize: 37),
                                ),
                                Column(
                                  children: <Widget>[
                                    Slider(
                                      activeColor: Colors.amber[700],
                                      max: 200,
                                      value: valueSlide,
                                      onChanged: (value) {
                                        setState(() {
                                          valueSlide = value;
                                        });
                                      },
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
                                      color: Colors.white.withAlpha(80)),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      dataInicioPG,
                                      style: TextStyle(
                                          fontSize: 17,
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
                                        FontAwesomeIcons.calendarAlt,
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
                        hintText: "Método de pagamento  (opicional)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
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
                        hintText: "Descriçao (opicional)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
