import 'package:flutter/material.dart';
import 'package:suno/screens/DetalheAssinatura.dart';

class CardAssinatura extends StatelessWidget {
  final int id;
  final String imagemUrl;
  final String nome;
  final String valor;
  final String plano;
  final String recorrencia;
  final String nota;
  final String metodoPG;
  final String descricao;
  final String data;

  const CardAssinatura(
      {Key key,
      this.id,
      this.imagemUrl,
      this.nome,
      this.valor,
      this.plano,
      this.recorrencia,
      this.nota,
      this.metodoPG,
      this.descricao,
      this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetalheAssinatura(
                        id: id,
                        urlImage: imagemUrl,
                        valor: valor,
                        nome: nome,
                        plano: plano,
                        recorrencia: recorrencia,
                        nota: nota,
                        metodoPG: metodoPG,
                        descricao: descricao,
                        data: data)));
          },
          child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 20,left: 15,right: 15),
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
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                          tag: id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              "$imagemUrl",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${nome}"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$${valor}",
                              style: TextStyle(color: Colors.orange[700]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Plano: ",
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100)),
                            Text("${plano}",
                            style: TextStyle(fontWeight: FontWeight.w100)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Recor: ",
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100)),
                            Text(                              
                              "${recorrencia}",
                              style: TextStyle(color: Colors.pink),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
