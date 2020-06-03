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

  const CardItemList({Key key, this.imagemUrl, this.nome, this.valor, this.plano, this.recorrencia, this.nota, this.metodoPG, this.descricao, this.data, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> DetalheAssinatura(
            id: id,
            urlImage: imagemUrl,
            valor: valor,
            nome: nome,
            plano: plano,
            recorrencia: recorrencia,
            nota: nota,
            metodoPG: metodoPG,
            descricao: descricao,
            data: data
          )
          ));
      },
      child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          //border: Border.all(width: 0.2,color: Colors.cyan[700]),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[850],
          boxShadow: [BoxShadow(
            offset: Offset(-2, 2), 
            blurRadius: 3,
            
          )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        //color: Colors.red[300],
                        
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(offset: 
                            Offset(-3, 3), 
                            blurRadius: 7,
                            color: Colors.grey[900]
                          )
                        ]),
                    child: Hero(
                      tag: id,
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "$imagemUrl",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    //color: Colors.black,
                    width: width * 0.5,
                    child: Text(
                      "$nome",overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              Container(
                //color: Colors.black,
                //width: width * 0.5,
                child: Text(
                  "$valor",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Plano: $plano"),
              Text("Recorrencia: $recorrencia")
            ],
          )
        ],
      ),
    ),
    ),
    );
  }
}
