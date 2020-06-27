import 'package:flutter/material.dart';
import 'package:suno/controles/ControleBanco.dart';
import 'package:suno/model/Assinatura.dart';

class CardAssinaturaInfo extends StatelessWidget {

  final Assinatura assinatura;

  const CardAssinaturaInfo({Key key, this.assinatura}) : super(key: key);

  delete() {
    ControleBanco cb = ControleBanco();
    cb.delete(assinatura);
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, bottom: 10, right: width * 0.05),
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: height * 0.03,bottom: height * 0.03,left: width * 0.06,right: width * 0.06),
          decoration: BoxDecoration(
            color: Colors.grey[900].withAlpha(100),
            borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                //padding: EdgeInsets.only(top: height * 0.03,bottom: height * 0.03,left: width * 0.045,right: width * 0.045),
                        height: width * 0.2,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          
                        ),
                        child: Hero(
                          tag: assinatura.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.1),
                              topRight: Radius.circular(width * 0.1),
                              bottomLeft: Radius.circular(width * 0.1),
                              bottomRight: Radius.circular(width * 0.1),
                            ),
                            child: Image.asset(
                              "${assinatura.urlLogo}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.04,right: width * 0.04),
                //padding: EdgeInsets.only(top: height * 0.03,bottom: height * 0.03,left: width * 0.045,right: width * 0.045),
                child: Column(   
                  crossAxisAlignment: CrossAxisAlignment.start,               
                  children: <Widget>[
                    Container(
                      width: width *0.4,
                      child: Text(assinatura.assinaturaName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        letterSpacing: 1
                      ),),
                    ),
                    SizedBox(height: 15,),
                    Text(assinatura.data,style: TextStyle(
                      fontSize: width * 0.03,
                      letterSpacing: 1,
                      color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Text(assinatura.recorrencia,style: TextStyle(
                      fontSize: width * 0.03,
                      letterSpacing: 1,
                      color: Colors.grey
                    ),),
                    SizedBox(width: 5,),
                    Text("\$${assinatura.valor}",
                    style: TextStyle(
                      fontSize: width * 0.03,
                      letterSpacing: 1,
                      color: Colors.orange
                    ),),
                      ],)
                    

                  ],
                ),
              ),
                ],
              ),
              
              GestureDetector(
                onTap: (){
                  delete();
                },
                child: Icon(Icons.delete_outline,color: Colors.red[300],),
              )
            ],
          ),
        ),
      ),
    );
  }
}