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
                            border:Border.all(color: selected ==true? Colors.teal[300]: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            texto,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      );
  }
}