import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suno/screens/Home.dart';
import 'package:suno/screens/InfoScreen.dart';
import 'package:suno/widgets/AppDrawer.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  int selectedIcon = 0;
  
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> telas = [
      Home(),      
      Container(height: height,width: width,color: Colors.black,),
      InfoScreen()
      ];
    
    
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(),
      //drawer: AppDrawer(),
      body: telas[selectedIcon],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.08),
          topRight: Radius.circular(width * 0.08),
        ),
        ),
        
        child: ClipRRect(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.08),
          topRight: Radius.circular(width * 0.08),
        ),
          child: BottomNavigationBar(
        //backgroundColor: Colors.black.withAlpha(180),
        backgroundColor: Color.fromARGB(190, 20, 20, 20),
        
        type: BottomNavigationBarType.fixed,
        //selectedItemColor: Colors.pink,
        selectedItemColor: Color.fromARGB(255, 217, 74, 122),
        unselectedItemColor: Colors.grey[700],
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        
        currentIndex: selectedIcon,
        onTap: (index){
          setState(() {
            selectedIcon = index;
            
          });
        },
        
        items: [
          BottomNavigationBarItem(
            title: Text("home"),
            icon:selectedIcon!= 0 
            ? Icon(FontAwesomeIcons.home,size: width * 0.06,)//bookmark
            : Icon(FontAwesomeIcons.home,size: width * 0.07,)
          ),
          BottomNavigationBarItem(
            title: Text("all"),
            icon: selectedIcon!= 1 
            ? Icon(FontAwesomeIcons.clone,size: width * 0.06,)
            : Icon(FontAwesomeIcons.clone,size: width * 0.07,)
          ),
          BottomNavigationBarItem(
            title: Text("info",),
            icon: selectedIcon!= 2 
            ? Icon(FontAwesomeIcons.grinWink,size: width * 0.06,)
            : Icon(FontAwesomeIcons.grinWink,size: width * 0.07,)
          ),
        ],
      ),
        )
      )
    );
  }

  



}