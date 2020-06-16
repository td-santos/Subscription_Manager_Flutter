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
  

  List<Widget> telas = [Home()];

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> telas = [
      Home(),      
      Container(height: height,width: width,color: Colors.green,),
      InfoScreen()
      ];
    
    
    return Scaffold(
      //appBar: AppBar(),
      //drawer: AppDrawer(),
      body: telas[selectedIcon],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withAlpha(180),
        
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 10),
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
            ? Icon(FontAwesomeIcons.bookmark,size: width * 0.05,)
            : Icon(FontAwesomeIcons.solidBookmark,size: width * 0.05,)
          ),
          BottomNavigationBarItem(
            title: Text("all"),
            icon: selectedIcon!= 1 
            ? Icon(FontAwesomeIcons.clone,size: width * 0.05,)
            : Icon(FontAwesomeIcons.solidClone,size: width * 0.05,)
          ),
          BottomNavigationBarItem(
            title: Text("info",),
            icon: selectedIcon!= 2 
            ? Icon(FontAwesomeIcons.grinWink,size: width * 0.05,)
            : Icon(FontAwesomeIcons.solidGrinWink,size: width * 0.05,)
          ),
        ],
      ),
    );
  }
}