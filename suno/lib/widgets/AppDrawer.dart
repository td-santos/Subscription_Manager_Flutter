import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height * 0.25,
            color: Colors.grey[900],
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("  Suno", style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200),),
            ),            
          ),
          SingleChildScrollView(
            child: Container(
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://colorindonuvens.com/wp-content/uploads/2020/03/Wallpaper4k-Preto-ColorindoNuvens-6.jpg"),
                  fit: BoxFit.cover,
                  )
              ),*/
              width: width,
              height: height * 0.75,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20,right: 20,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.attach_money,color: Colors.orange[700],),
                                Text(" Proximo mês: ",style: TextStyle(fontSize: 15),),
                              ],
                            ),
                            Text("2000.00",style: TextStyle(fontSize: 15),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.white,height: 1,),
                       Padding(
                        padding: EdgeInsets.only(left: 20, top: 20,right: 20,bottom: 20),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.description,color: Colors.orange[700],),
                            Text(" Assinaturas cadastradas",style: TextStyle(fontSize: 15),),
                            //Text("2000.00")
                          ],
                        ),
                      ),
                      Divider(color: Colors.white,height: 1,),
                    ],
                  ),
                  
                  Column(
                    children: <Widget>[
                      Divider(color: Colors.white,height: 1,),
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 40,right: 20,top: 20),
                        child: Row(
                          children: <Widget>[
                            
                            Icon(Icons.info,color: Colors.orange[700],),
                            Text(" Sobre",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}