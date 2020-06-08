import 'package:flutter/material.dart';
import 'package:suno/screens/DetalheAssinatura.dart';

class CardItemList extends StatelessWidget {
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

  const CardItemList(
      {Key key,
      this.imagemUrl,
      this.nome,
      this.valor,
      this.plano,
      this.recorrencia,
      this.nota,
      this.metodoPG,
      this.descricao,
      this.data,
      this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color cinzaEscuro = Color(0xff383844);
    Color cinzaEscuro2 = Color(0xff2E3035);

    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
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
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(width * 0.015),
            borderRadius: BorderRadius.circular(width * 0.035),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey[900].withAlpha(100), Colors.grey[900]]),
            boxShadow: [
              BoxShadow(
                offset: Offset(-2, 2),
                blurRadius: 3,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-3, 3),
                                blurRadius: 3,
                                spreadRadius: 1,
                                color: Colors.grey[900])
                          ],
                        ),
                        child: Hero(
                          tag: id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            child: Image.asset(
                              "$imagemUrl",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        //color: Colors.blue,
                        width: width * 0.42,
                        child: Text("$nome",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: width * 0.045,fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("R\$ ",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[700]
                          ),
                        ),
                        Text("${valor.replaceAll(".", ",")}",
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w300,
                            color: Colors.green[400]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Plano: $plano", style: TextStyle(
                    fontWeight: FontWeight.w100
                  ),),
                  Container(
                    padding:EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.pink[200],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pink[300], Colors.purple[400]],
                      ),
                      borderRadius: BorderRadius.circular(width * 0.02),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text("Recorrencia: ",
                        style: TextStyle(
                              fontWeight: FontWeight.w100,
                              //fontSize: width * 0.035,
                              ),
                              ),
                        Text("$recorrencia",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: width * 0.035),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
