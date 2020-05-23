import 'package:flutter/material.dart';

class CardItemList extends StatelessWidget {
  final String imagemUrl;

  const CardItemList({Key key, this.imagemUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
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
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(offset: 
                            Offset(-3, 3), 
                            blurRadius: 7,
                            color: Colors.grey[900]
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "$imagemUrl",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Nome ... ... .. .",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Text(
                "33.33",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Plano: Premium"),
              Text("Recorrencia: Mensal")
            ],
          )
        ],
      ),
    ),
    );
  }
}
