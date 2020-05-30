import 'package:flutter/material.dart';
import 'package:suno/controles/AssinaturaDB.dart';
import 'package:suno/model/Assinatura.dart';

class ControleBanco {
  ControleBanco() {}

  delete(BuildContext context, String assinaturaName) {
    AssinaturaDB assdb = AssinaturaDB();
    assdb.deleteAssinatura(assinaturaName);
    Navigator.pop(context);
  }

  salvarDB(BuildContext context,String assinaturaName,String plano,String recorrencia,
      double valor,String urlLogo,String nota,String dataInicioPG,String metodoPG,String descricao, int dia,int mes,int ano) {
     
    if (assinaturaName != null && plano != null && recorrencia != null && valor != 0 && urlLogo != null) {
      
    /*     int loop=0;
     if(recorrencia == "unica"){
       loop=0;
     } else if(recorrencia == "mensal"){
       loop= loop+24;
     }  else if(recorrencia == "anual"){
       loop =loop+5;
     }
     int mesLoop;

     for(int i =0 ;i<=loop; i++){
       Assinatura ass = Assinatura();

       ass.data = "${dia}/${mes+i}/${ano}";
       print("DATA DO LOOP: ${ass.data}");
     }*/
      
      Assinatura ass = Assinatura();
      ass.assinaturaName = assinaturaName;
      ass.plano = plano;
      ass.recorrencia = recorrencia;
      ass.nota = nota;
      ass.valor = valor;
      ass.data = dataInicioPG;
      ass.metodoPG = metodoPG;
      ass.descricao = descricao;
      ass.urlLogo = urlLogo;
      //print("\nlogo: ${urlLogo}\n");

      print(ass.toString());

      AssinaturaDB assDB = AssinaturaDB();
      assDB.saveAssinatura(ass);
      print("\nSalvo");
      Navigator.pop(context);
    } else {
      print("Preencha");
    }
  }
}
