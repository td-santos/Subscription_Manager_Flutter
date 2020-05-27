final String assinaturaTABLE = "assinaturaTABLE";
final String idColumn = "idColumn";
final String assinaturaNameColumn = "assinaturaNameColumn";
final String planoColumn = "planoColumn";
final String recorrenciaColumn = "recorrenciaColumn";
final String notaColumn = "notaColumn";
final String valorColumn = "valorColumn";
final String dataColumn = "dataColumn";
final String metodoPGColumn = "metodoPGColumn";
final String descricaoColumn = "descricaoColumn";
final String urlLogoColumn = "urlLogoColumn";

class Assinatura {
  int id;
  String assinaturaName;
  String plano;
  String recorrencia;
  String nota;
  double valor;
  String data;
  String metodoPG;
  String descricao;
  String urlLogo;

  Assinatura();

  Assinatura.fromMap(Map map) {
    id = map[idColumn];
    assinaturaName = map[assinaturaNameColumn];
    plano = map[planoColumn];
    recorrencia = map[recorrenciaColumn];
    nota = map[notaColumn];
    valor = map[valorColumn];
    data = map[dataColumn];
    metodoPG = map[metodoPGColumn];
    descricao = map[descricaoColumn];
    urlLogo = map[urlLogoColumn];
  }

  Map toMap(){
    Map<String,dynamic> map ={
      assinaturaNameColumn : assinaturaName,
      planoColumn : plano,
      recorrenciaColumn : recorrencia,
      notaColumn : nota,
      valorColumn : valor,
      dataColumn : data,
      metodoPGColumn : metodoPG,
      descricaoColumn : descricao,
      urlLogoColumn : urlLogo
    };

    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  String toString(){
    return "\nAssinatura(\nId= $id \nNome= $assinaturaName \nPlano= $plano \nRecorrencia= $recorrencia \nNota= $nota \nValor= $valor \n"
    +"Data= $data \nMetodoPG= $metodoPG \nDesc= $descricao \nUrlLogo= $urlLogo \n)";
  }
}
