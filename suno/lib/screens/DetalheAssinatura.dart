import 'package:flutter/material.dart';
import 'package:suno/controles/ControleBanco.dart';

class DetalheAssinatura extends StatefulWidget {
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
      this.data, this.id})
      : super(key: key);

  @override
  _DetalheAssinaturaState createState() => _DetalheAssinaturaState();
}

class _DetalheAssinaturaState extends State<DetalheAssinatura> {
  delete() {
    ControleBanco cb = ControleBanco();
    cb.delete(context, widget.nome);
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
          padding: EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Container(
            height: height,
            width: width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.arrow_back_ios),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              delete();
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.red[700],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              //salvar();
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Colors.amber[700],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.grey[900]),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: width,
                          height: height * 0.2,
                          decoration: BoxDecoration(
                              //color: Colors.pink
                              ),
                          child: Hero(
                            tag: widget.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                widget.urlImage,
                                fit: BoxFit.cover,
                              )),
                          )
                              ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[850]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Assinatura: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(
                                    widget.nome,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.orange[700]),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[900],
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Valor: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(widget.valor,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange[700])),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[900],
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Plano: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(widget.plano,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange[700])),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[900],
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Recorência: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(widget.recorrencia,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange[700])),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[850]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Nota: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(
                                    widget.nota,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.orange[700]),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[900],
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Matodo PG: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(widget.metodoPG,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange[700])),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[900],
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Descrição: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Container(
                                    //color: Colors.blue,
                                    alignment: Alignment.centerRight,
                                    width: width * 0.6,
                                    child: Text(widget.descricao,
                                        overflow: TextOverflow.ellipsis,
                                         textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.orange[700])),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[900],
                              height: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Data PG: ",
                                      style: TextStyle(
                                          color: Colors.white.withAlpha(80))),
                                  Text(widget.data,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange[700])),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
