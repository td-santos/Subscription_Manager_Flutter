import 'package:flutter/material.dart';
import 'package:suno/model/Listas.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],

      body: SafeArea(
        child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          //height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 0,right: 0,bottom: 10,top: 30),
                child: Text("Music", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
              ),
              SizedBox(
                  height: 250,
                  //width: 400,
                  child: GridView.builder(
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
              SizedBox(
                  height: 250,
                  //width: 400,
                  child: GridView.builder(
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
              SizedBox(
                  height: 160,
                  //width: 400,
                  child: GridView.builder(
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
              SizedBox(
                  height: 150,
                  //width: 400,
                  child: GridView.builder(
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
              SizedBox(
                  height: 150,
                  //width: 400,
                  child: GridView.builder(
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
            ],
          ),
        ),
      )
        ),
      
    );
  }
}