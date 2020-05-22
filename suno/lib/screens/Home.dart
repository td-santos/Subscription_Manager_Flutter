import 'package:flutter/material.dart';
import 'package:suno/widgets/CardItemList.dart';

import 'AddAssinatra.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Assinaturas",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAssinatura()));
                }),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        spreadRadius: -2.0,
                        blurRadius: 4.0,
                      )
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total: ",
                          style: TextStyle(fontSize: 25, color: Colors.grey)
                        ),
                        Text(
                          "240,99",
                          style: TextStyle(fontSize: 40, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: CardItemList(
                  imagemUrl: "assets/netflix.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: CardItemList(
                  imagemUrl: "assets/spotify.png",
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: CardItemList(
                  imagemUrl: "assets/netflix.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: CardItemList(
                  imagemUrl: "assets/spotify.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: CardItemList(
                  imagemUrl: "assets/netflix.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: CardItemList(
                  imagemUrl: "assets/spotify.png",
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      )),
    );
  }
}
