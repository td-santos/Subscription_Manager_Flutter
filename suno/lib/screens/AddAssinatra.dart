

import 'package:flutter/material.dart';
import 'package:suno/widgets/ContainerOption.dart';

class AddAssinatura extends StatefulWidget {
  @override
  _AddAssinaturaState createState() => _AddAssinaturaState();
}

class _AddAssinaturaState extends State<AddAssinatura> {
  double valueSlide;
  bool planB,planP,planPr =false;
  bool recU,recM,recA = false;

  TextEditingController _controllerAssinatura = TextEditingController();
  TextEditingController _controllerDesc = TextEditingController();
  String plano,recorrencia;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueSlide = 0;
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
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  onTap: (){

                    print("Assinatura: ${_controllerAssinatura.text}\n");
                    print("Plano: ${plano}\n");
                    print("Recorrência: ${recorrencia}\n");
                    print("Valor: ${valueSlide.toStringAsFixed(2).toString()}\n");
                    print("Descricao: ${_controllerDesc.text}\n");
                  },
                                  child: Container(
                      padding:
                          EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("Save"),
                      )),
                )
              ],
            ),

            SizedBox(height: 40,),

            Text("Add"),

            SizedBox(height: 20,),

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
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.blur_on,
                            size: 30,
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
                        onTap: (){
                          setState(() {
                            planP=false;
                            planPr = false;
                            planB =true;
                            plano ="Básico";
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
                        onTap: (){
                          setState(() {
                            planP=true;
                            planPr = false;
                            planB =false;
                            plano ="Padrao";
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
                        onTap: (){
                          setState(() {
                            planP=false;
                            planPr = true;
                            planB =false;
                            plano ="Premium";
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
                        onTap: (){
                          setState(() {
                            recU=true;
                            recM = false;
                            recA =false;
                            recorrencia = "Única";
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
                        onTap: (){
                          setState(() {
                            recU=false;
                            recM = true;
                            recA =false;
                            recorrencia = "Mensal";
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
                        onTap: (){
                          setState(() {
                            recU=false;
                            recM = false;
                            recA =true;
                            recorrencia = "Anual";
                          });
                        },
                                              child: ContainerOption(
                          selected: recA,
                          texto: "Anual",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("PG"),
            SizedBox(
              height: 10,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${valueSlide.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 40),
                          ),
                          Column(
                            children: <Widget>[
                              Slider(
                                max: 200,
                                value: valueSlide,
                                onChanged: (value) {
                                  setState(() {
                                    valueSlide = value;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _controllerDesc,
                    maxLines: 4,
                    
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Descriçao",
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
