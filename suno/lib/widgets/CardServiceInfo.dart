import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardServiceInfo extends StatelessWidget {

  final String nomeServico;
  final String urlLogo;

  const CardServiceInfo({Key key, this.nomeServico, this.urlLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(width * 0.02),
      child: Container(
        
        decoration: BoxDecoration(
          //color: Colors.blue.withOpacity(0.5),
          //borderRadius: BorderRadius.circular(width * 0.3)
        ),
        child: ExpansionTile(
          title: Text(nomeServico,style: TextStyle(
            fontWeight: FontWeight.w600
          ),),
          leading: Icon(FontAwesomeIcons.solidCircle,size: width * 0.04,color: Colors.greenAccent[400],),

          children: <Widget>[
            Container(
              width: width,
              height: width * 0.4,              
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),

                ),
                child: Image.asset(urlLogo,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 10,)
          ],
        )
      ),
    );
  }
}