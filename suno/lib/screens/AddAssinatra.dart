import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:suno/widgets/ContainerOption.dart';

class AddAssinatura extends StatefulWidget {
  @override
  _AddAssinaturaState createState() => _AddAssinaturaState();
}

class _AddAssinaturaState extends State<AddAssinatura> {
  double valueSlide;
  bool planB, planP, planPr = false;
  bool recU, recM, recA = false;
  String urlLogo;
  IconData iconSelecionado;
  DateFormat format_ddMMyyy = DateFormat("dd/MM/yyyy");
  String dataInicioPG;

  TextEditingController _controllerAssinatura = TextEditingController();
  TextEditingController _controllerDesc = TextEditingController();
  TextEditingController _controllerNota = TextEditingController();
  TextEditingController _controllerMetPG = TextEditingController();
  String plano, recorrencia;

  salvar(){

    if(_controllerAssinatura.text != null && plano != null && recorrencia != null && valueSlide != 0 ){

      if(iconSelecionado != null || urlLogo != null){
        print("Assinatura: ${_controllerAssinatura.text}\n");
        print("Plano: ${plano}\n");
        print("Recorrência: ${recorrencia}\n");
        print("Nota: ${_controllerNota.text}\n");
        print("Valor: ${valueSlide.toStringAsFixed(2).toString()}\n");
        print("Data inicio: ${dataInicioPG}\n");
        print("Método Pg: ${_controllerMetPG.text}\n");
        print("Descricao: ${_controllerDesc.text}\n");

        if(urlLogo == null ){
          print("icon: ${iconSelecionado}\n");  
           
        }else{
          print("\nlogo: ${urlLogo}\n");
        }
          print("\nSalvo");
        } else{
          print("Preencha");
        }     

    } else{
      print("Preencha");
    }
    
                   
  }

  showDialogLogos() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              //title: Text("Logos"),
              content: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(17)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Padrão"),
                      SizedBox(
                        height: 60,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mapIconLogos.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  Future.delayed(Duration(milliseconds: 300), () {
                                    setState(() {
                                      urlLogo =null;
                                      iconSelecionado = mapIconLogos[index];
                                    });
                                  });
                                },
                              child: Container(
                                height: 60,
                                width: 60,                            
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(15), 
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Icon(
                                    mapIconLogos[index],
                                    
                                  ),
                                ),
                              ),
                            ),
                            );
                          }
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Teste'),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 500,
                        width: 400,
                        child: GridView.builder(
                          itemCount: mapLogos.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Future.delayed(Duration(milliseconds: 300), () {
                                  setState(() {
                                    urlLogo = mapLogos[index];
                                  });
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,                            
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(15), 
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    mapLogos[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  selectDate()async{
    final dataPicker = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(3000),
      
      );
      if(dataPicker != null){
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
                  child: Icon(Icons.arrow_back_ios),
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
                                    iconSelecionado== null ? Icons.style: iconSelecionado,
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
                        onTap: () {
                          setState(() {
                            recU = false;
                            recM = true;
                            recA = false;
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
                        onTap: () {
                          setState(() {
                            recU = false;
                            recM = false;
                            recA = true;
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
              padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
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
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Primeiro pagamento:  ",style: TextStyle(color: Colors.white.withAlpha(80)),),
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
                                      onTap: (){
                                        selectDate();
                                      },
                                      child: Icon(Icons.edit,color: Colors.white.withAlpha(170),),
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

Map<int,dynamic> mapIconLogos ={
  0: FontAwesomeIcons.music, //music
  1: FontAwesomeIcons.gamepad,//game
  2: FontAwesomeIcons.boxOpen,//misteryBox ou cube
  3: FontAwesomeIcons.bookOpen,//livros
  4: FontAwesomeIcons.palette,//design
  5: FontAwesomeIcons.tv,//tv cabo
  6: FontAwesomeIcons.graduationCap,//educaçao
  7: FontAwesomeIcons.utensils,//comida
  8: Icons.cast,//stream video
  9: FontAwesomeIcons.users,//social media
  10: FontAwesomeIcons.stethoscope,//saude
  11: FontAwesomeIcons.googlePlay ,// apps
  12: FontAwesomeIcons.cube,
  13: FontAwesomeIcons.gem,
  14: FontAwesomeIcons.question,
  15: FontAwesomeIcons.rocketchat,
  16: FontAwesomeIcons.wifi,
};

Map<int, String> mapLogos = {
  0: "assets/netflix.png",
  1: "assets/spotify.png",
  2: "assets/adobe_creative.jpeg",
  3: "assets/amazon_primevideo.png",
  4: "assets/apple_music.jpg",
  5: "assets/apple_tv.png",
  6: "assets/crunchyroll.png",
  7: "assets/deezer.jpg",
  8: "assets/globoplay.png",
  9: "assets/looke.png",
  10: "assets/office.png",
  11: "assets/telecineplay.png",
  12: "assets/youtube_music.jpg",
  13: "assets/youtube_premium.jpg",
  14: "assets/linkedin_premium.jpeg",
  15: "assets/kindle_unlimited.png",
  16: "assets/viki.png",
  17: "assets/apple_arcade.jpeg",
  18: "assets/stadia.jpg",
  19: "assets/psn.png",
  20: "assets/xbox_live.jpg",
  21: "assets/ea_access.png",
  22: "assets/xbox_gamepass.jpg",
  23: "assets/nintendo_online.jpg",
  24: "assets/disney_pluss.png",
  25: "assets/hulu.png",
  26: "assets/hbo.png",
  27: "assets/slack.png",
  28: "assets/figma.png",
  29: "assets/sketch.png",
  30: "assets/zoom2.png",
  
};
