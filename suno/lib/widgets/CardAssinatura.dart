import 'package:flutter/material.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/screens/DetalheAssinatura.dart';

class CardAssinatura extends StatelessWidget {
  final Assinatura assinatura;
  /*final int id;
  final String imagemUrl;
  final String nome;
  final String valor;
  final String plano;
  final String recorrencia;
  final String nota;
  final String metodoPG;
  final String descricao;
  final String data;*/

  const CardAssinatura(
      {Key key,
      /*this.id,
      this.imagemUrl,
      this.nome,
      this.valor,
      this.plano,
      this.recorrencia,
      this.nota,
      this.metodoPG,
      this.descricao,
      this.data,*/ this.assinatura})
      : super(key: key);

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.only(left: width * 0.05, bottom: 10, right: width * 0.05),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetalheAssinatura(
                      assinatura: assinatura,
                        id: assinatura.id,
                        urlImage: assinatura.urlLogo,
                        valor: format(assinatura.valor),
                        nome: assinatura.assinaturaName,
                        plano: assinatura.plano,
                        recorrencia: assinatura.recorrencia,
                        nota: assinatura.nota,
                        metodoPG: assinatura.metodoPG,
                        descricao: assinatura.descricao,
                        data: assinatura.data)));
          },
          child: Container(
              padding: EdgeInsets.only(top: height * 0.03,bottom: height * 0.03,left: width * 0.045,right: width * 0.045),
              decoration: BoxDecoration(
                color: Colors.grey[900].withAlpha(100),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: width * 0.11,
                        width: width * 0.11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-3, 3),
                              blurRadius: 3,
                              spreadRadius: 1,
                              //color: Colors.grey[900]
                            )
                          ],
                        ),
                        child: Hero(
                          tag: assinatura.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.03),
                              topRight: Radius.circular(width * 0.03),
                              bottomLeft: Radius.circular(width * 0.03),
                              bottomRight: Radius.circular(width * 0.03),
                            ),
                            child: Image.asset(
                              "${assinatura.urlLogo}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: width * 0.35,
                              //color: Colors.purple,
                              child: Text("${assinatura.assinaturaName}",overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width * 0.032
                              ),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$${format(assinatura.valor)}",
                              style: TextStyle(color: Colors.orange[700],fontSize: width * 0.032),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      
                      children: <Widget>[
                        Container(
                          width: width * 0.26,
                          //color: Colors.purple,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("Plano: ",
                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,fontSize: width * 0.032)),
                              Text("${assinatura.plano}",
                              style: TextStyle(fontWeight: FontWeight.w100,fontSize: width * 0.035)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5
                        ),
                        
                        Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                             /* Text("Recor: ",
                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100)),*/
                              Icon(Icons.sync,color: Colors.grey,size: width * 0.03,),
                              SizedBox(width: 5),
                              Text(                              
                                "${assinatura.recorrencia}",
                                style: TextStyle(color: Colors.pink,fontSize: width * 0.035),
                              ),
                            ],
                          ),
                        
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
