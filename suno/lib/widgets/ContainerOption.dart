import 'package:flutter/material.dart';

class ContainerOption extends StatelessWidget {
  final String texto;
  final bool selected;

  const ContainerOption({Key key, this.texto, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.grey[900],
          border: Border.all(
              color: selected == true ? Colors.amber[800] : Colors.transparent,
              width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: selected == true ?[
            BoxShadow(
                offset: Offset(-3, 3), blurRadius: 7, color: Colors.black)
          ]
          :null),
      child: Center(
        child: Text(
          texto,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
