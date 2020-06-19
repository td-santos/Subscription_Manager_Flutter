import 'package:flutter/material.dart';
import 'package:suno/controles/ControleBanco.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/screens/AddAssinatra.dart';

class DetalheAssinatura extends StatefulWidget {
  final Assinatura assinatura;
  final int id;
  final String urlImage;
  final String valor;
  final String nome;
  final String plano;
  final String recorrencia;
  final String nota;
  final String metodoPG;
  final String descricao;
  final String data;

  const DetalheAssinatura(
      {Key key,
      this.urlImage,
      this.valor,
      this.nome,
      this.plano,
      this.recorrencia,
      this.nota,
      this.metodoPG,
      this.descricao,
      this.data,
      this.id, this.assinatura})
      : super(key: key);

  @override
  _DetalheAssinaturaState createState() => _DetalheAssinaturaState();
}

class _DetalheAssinaturaState extends State<DetalheAssinatura> {

  delete() {
    ControleBanco cb = ControleBanco();
    cb.delete(context, widget.assinatura);
  }

  @override
  Widget build(BuildContext context) {
    Color cinzaEscuro2 = Color(0xff2E3035);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  delete();
                },
                child: Container(
                  height: 25, width: 65,
                  //padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=> AddAssinatura(assinatura: widget.assinatura)
                    ));
                },
                child: Container(
                  height: 25, width: 55,
                  //padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.amber[700],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.grey[900]),
                    ),
                  ),
                ),
              ),
              Container(
                width: 15,
              )
            ],
          )
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
              colors: [Colors.grey[900], Colors.black],
            ),
          ),*/
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Container(
              //height: height* 1.5,
              width: width,
              child: Column(
                children: <Widget>[
                  Container(
                    
                    width: width,
                    height: height * 0.2,
                    child: Hero(
                      tag: widget.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          widget.urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  container1(width,height),
                  SizedBox(height: 20),
                  container2(width),
                  Container(height: 100)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget container1(double width,double height) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), 
          color:Colors.grey[900].withAlpha(150),
          //color: Colors.grey[850],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Assinatura: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Container(                  
                  //color: Colors.purple,
                  width: width * 0.6,
                  child: Text(                      
                      widget.nome,overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: width * 0.04, color: Colors.orange[700]),
                    ),
                  
                  
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[900],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Valor: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Text(widget.valor,
                    style: TextStyle(fontSize: width * 0.04, color: Colors.orange[700])),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[900],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Plano: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Text(widget.plano,
                    style: TextStyle(fontSize: width * 0.04, color: Colors.orange[700])),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[900],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Recorência: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Text(widget.recorrencia,
                    style: TextStyle(fontSize: width * 0.04, color: Colors.orange[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget container2(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), 
          color: Colors.grey[900].withAlpha(150),
          //color: Colors.grey[850]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Nota: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Container(
                  width: width * 0.6,
                  child: widget.nota.isEmpty
                  ?Text("sem informação",textAlign: TextAlign.right,
                  style: TextStyle(fontSize: width * 0.04, color: Colors.grey.withAlpha(80)),
                  )
                   :ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      widget.nota,
                      //overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: width * 0.04, color: Colors.orange[700]),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[900],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Método PG: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Container(
                    width: width * 0.6,
                    child:widget.metodoPG.isEmpty
                    ?Text("sem informação",textAlign: TextAlign.right,
                      style: TextStyle(fontSize: width * 0.04, color: Colors.grey.withAlpha(80)),
                    )
                   :ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(widget.metodoPG,
                          //overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: width * 0.04, color: Colors.orange[700])),
                    ))
              ],
            ),
          ),
          Divider(
            color: Colors.grey[900],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Descrição: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Container(
                    //color: Colors.blue,
                    alignment: Alignment.centerRight,
                    width: width * 0.6,
                    child: widget.descricao.isEmpty
                    ?Text("sem informação",textAlign: TextAlign.right,
                      style: TextStyle(fontSize: width * 0.04, color: Colors.grey.withAlpha(80)),
                    )
                   :ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(widget.descricao,
                          //overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: width * 0.04, color: Colors.orange[700])),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[900],
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Data PG: ",
                    style: TextStyle(color: Colors.white.withAlpha(80),fontSize: width * 0.033)),
                Text(widget.data,
                    style: TextStyle(fontSize: width * 0.04, color: Colors.orange[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
