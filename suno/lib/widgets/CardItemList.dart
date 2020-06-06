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
    Color cinzaEscuro = Color(0xff383844);
    Color cinzaEscuro2 = Color(0xff2E3035);

    return Padding(padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
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
      padding: EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 10),
      decoration: BoxDecoration(
          //border: Border.all(width: 0.2,color: Colors.cyan[700]),
          borderRadius: BorderRadius.circular(width * 0.045),
          //color: Colors.grey[850],
          //color: cinzaEscuro,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cinzaEscuro2, Colors.grey[900]]
            ),
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
                    //color: Colors.blue,
                    width: width * 0.42,
                    child: Text(
                      "$nome",overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  )
                ],
              ),
              Container(
                //color: Colors.red,
                //width: width * 0.5,
                child: Text(
                  "R\$ ${valor.replaceAll(".", ",")}",
                  style: TextStyle(fontSize: width * 0.05,),
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
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pink[300],Colors.purple[400]]),
                  borderRadius: BorderRadius.circular(width * 0.02)
                ),
                child: Row(
                  children: <Widget>[
                    Text("Recorrencia: "),
                    Text("$recorrencia",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.035
                    ),),
                  ],
                )
                )
            ],
          )
        ],
      ),
    ),
    ),
    );
  }
}
