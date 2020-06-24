import 'package:flutter/material.dart';
import 'package:suno/controles/AssinaturaDB.dart';
import 'package:suno/model/Assinatura.dart';
import 'package:suno/screens/Home.dart';

class ControleBanco {
  ControleBanco() {}

  delete( Assinatura assinatura,{BuildContext context}) {
    AssinaturaDB assdb = AssinaturaDB();
    assdb.deleteAssinatura(assinatura.id);
    if(context !=null){
      Navigator.pop(context);
    }
    
  }

  


  salvarDB(bool edit,BuildContext context,String assinaturaName,String plano,String recorrencia,
      double valor,String urlLogo,String nota,String dataInicioPG,String metodoPG,String descricao, int dia,int mes,int ano,{int id}) {
     
    if (assinaturaName.isNotEmpty && plano != null && recorrencia != null && valor != 0 && urlLogo != null) {
      
    
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
      if(edit == false){
        
        assDB.saveAssinatura(ass);
        print("\nSalvo");
        Navigator.pop(context);
      }else{
        ass.id = id;
        assDB.updateAssinatura(ass);
        print("\nEditado");
        //Navigator.pop(context);
        Navigator.pop(context);
        
      }
      
      
    } else {
      print("Preencha");
    }
  }
}
