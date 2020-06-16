import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suno/screens/InitialPage.dart';

import 'Home.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => InitialPage()//Home()
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

     

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        width: height,
        child: Center(
          child: Text("SUNO", style: TextStyle(
              fontFamily: "Stentiga",
              fontSize: width * 0.25,
              color: Colors.white
            ),),
          /*Container(
            
            height: 200,
            width: 200,
           // padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.5),
              color: Colors.deepPurple[700]
            ),
            child: Center(
              child: Text("SUNO", style: TextStyle(
              fontFamily: "Stentiga",
              fontSize: width * 0.1,
              
            ),),
            )
          ),*/
        ),
      ),
    );
  }
}
