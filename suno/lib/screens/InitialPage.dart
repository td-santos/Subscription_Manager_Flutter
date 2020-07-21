import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:suno/screens/AllSubscribes.dart';
import 'package:suno/screens/Home.dart';
import 'package:suno/screens/InfoScreen.dart';
import 'package:suno/screens/infoLogo.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int selectedIcon = 0;
  var _pageController = PageController();
  var telas = [Home(), AllSubscribes(), InfoLogo(), InfoScreen()];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          children: telas,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIcon = index;
            });
          },
        ), //telas[selectedIcon],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
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
                backgroundColor: Color.fromARGB(190, 20, 20, 20),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromARGB(255, 217, 74, 122),
                unselectedItemColor: Colors.grey[700],
                selectedLabelStyle: TextStyle(fontSize: 0),
                unselectedLabelStyle: TextStyle(fontSize: 0),
                currentIndex: selectedIcon,
                onTap: (index) {
                  setState(() {
                    selectedIcon = index;
                    _pageController.jumpToPage(selectedIcon);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      title: Text("home"),
                      icon: selectedIcon != 0
                          ? Icon(FontAwesomeIcons.home,
                              size: width * 0.06,
                            ) //bookmark
                          : Icon(FontAwesomeIcons.home,
                              size: width * 0.07,
                            )),
                  BottomNavigationBarItem(
                      title: Text("all"),
                      icon: selectedIcon != 1
                          ? Icon(FontAwesomeIcons.clone,
                              size: width * 0.06,
                            )
                          : Icon(FontAwesomeIcons.clone,
                              size: width * 0.07,
                            )),
                  BottomNavigationBarItem(
                      title: Text("services"),
                      icon: selectedIcon != 2
                          ? Icon(FontAwesomeIcons.grinWink,
                              size: width * 0.06,
                            )
                          : Icon(FontAwesomeIcons.grinWink,
                              size: width * 0.07,
                            )),
                  BottomNavigationBarItem(
                      title: Text("info"),
                      icon: selectedIcon != 3
                          ? Icon(FontAwesomeIcons.infoCircle,
                              size: width * 0.06,
                            )
                          : Icon(FontAwesomeIcons.infoCircle,
                              size: width * 0.07,
                            )),
                ],
              ),
            )));
  }
}
