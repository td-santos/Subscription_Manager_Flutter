import 'package:flutter/material.dart';
import 'package:suno/model/Listas.dart';
import 'package:suno/screens/AddAssinatra.dart';

class DiaogLogos extends StatefulWidget {
  @override
  _DiaogLogosState createState() => _DiaogLogosState();
}

class _DiaogLogosState extends State<DiaogLogos> { 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        //title: Text("Logos"),
        content: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(17)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Padrão"),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mapIconLogos.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Future.delayed(Duration(milliseconds: 300), () {
                                setState(() {
                                  //urlLogo = null;
                                  //iconSelecionado = mapIconLogos[index];
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
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Teste'),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 400,
                  width: 400,
                  child: GridView.builder(
                    itemCount: mapLogos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, mapLogos[index]);
                          //Future.delayed(Duration(milliseconds: 300), () {
                          //  setState(() {
                          //urlLogo = mapLogos[index];
                          // });
                          //}
                          // );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "mapLogos[index]",
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
  }
}
