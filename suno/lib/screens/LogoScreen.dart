import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suno/model/Listas.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  Color cinzaEscuro2 = Color(0xff2E3035);
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      
      //backgroundColor: Colors.black,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        // leading: GestureDetector(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //   child: Icon(FontAwesomeIcons.angleLeft),
        // )
      ),*/

      body: SafeArea(
        child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 0),
          //height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [cinzaEscuro2, Colors.grey[900]]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0,right: 10,top: 15,bottom: 15),
                child: Row(                  
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(                      
                      child: Text(
                        "Logos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              
              Padding(padding: EdgeInsets.only(left: 0,right: 0,bottom: 10,top: 10),
                child: Text("Music", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
              ),
              Container(
                               
                  height: 250,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], 
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: mapLogoMusic.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, mapLogoMusic[index]);
                          
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                              offset: Offset(-3,3),
                              blurRadius: 4
                            )]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              mapLogoMusic[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 0,right: 0,bottom: 10,top: 20),
                child: Text("Stream Video", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
              ),
              Container(
                  height: 250,
                  //width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], 
                    borderRadius: BorderRadius.circular(15),),
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: mapLogoVideo.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, mapLogoVideo[index]);
                          
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                              offset: Offset(-3,3),
                              blurRadius: 4
                            )]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              mapLogoVideo[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 0,right: 0,bottom: 10,top: 20),
                child: Text("Games", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
              ),
              Container(
                  height: 160,
                  //width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], 
                    borderRadius: BorderRadius.circular(15),),
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: mapLogoGames.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, mapLogoGames[index]);
                          
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                              offset: Offset(-3,3),
                              blurRadius: 4
                            )]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              mapLogoGames[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 0,right: 0,bottom: 10,top: 20),
                child: Text("Design", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
              ),
              Container(
                  height: 150,
                  //width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], 
                    borderRadius: BorderRadius.circular(15),),
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: mapLogoDesign.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, mapLogoDesign[index]);
                          
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                              offset: Offset(-3,3),
                              blurRadius: 4
                            )]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              mapLogoDesign[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(left: 0,right: 0,bottom: 10,top: 20),
                child: Text("Outros", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
              ),
              Container(
                  height: 150,
                  //width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], 
                    borderRadius: BorderRadius.circular(15),),
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: mapLogoOutros.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, mapLogoOutros[index]);
                          
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                              offset: Offset(-3,3),
                              blurRadius: 4
                            )]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              mapLogoOutros[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 100,)
            ],
          ),
        ),
      )
        ),
      
    );
  }
}