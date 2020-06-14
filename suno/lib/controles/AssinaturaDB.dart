import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:suno/model/Assinatura.dart';

class AssinaturaDB{

  static final AssinaturaDB _instance =AssinaturaDB.internal();

  factory AssinaturaDB() => _instance;

  AssinaturaDB.internal();

  Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "assinaturas.db");

    return await openDatabase(path,version: 1,onCreate: (Database db,int newerVersion)async{
      await db.execute(
        "CREATE TABLE $assinaturaTABLE(" +
        "$idColumn INTEGER PRIMARY KEY,"+
        "$assinaturaNameColumn TEXT,"+
        "$valorColumn FLOAT,"+
        "$planoColumn TEXT,"+
        "$recorrenciaColumn TEXT,"+
        "$notaColumn TEXT,"+
        "$dataColumn TEXT,"+
        "$metodoPGColumn TEXT,"+
        "$descricaoColumn TEXT,"+
        "$urlLogoColumn TEXT)"
            
      );
    });

  }

  Future<Assinatura> saveAssinatura(Assinatura assinatura)async{
    print("chamada save");
    Database dbAssinaturas = await db;
    assinatura.id = await dbAssinaturas.insert(assinaturaTABLE, assinatura.toMap());
    return assinatura;
  }

  Future<int> updateAssinatura(Assinatura assinatura)async{
    print("chamada update");
    print(assinatura.toString());
    Database dbAssinatura = await db;
    return await dbAssinatura.update(assinaturaTABLE,assinatura.toMap(),
    where: "$idColumn =?",
    whereArgs: [assinatura.id]
    );
  }

  Future<int> deleteAssinatura(String assinaturaName)async{
    Database dbAssinatura = await db;
    return await dbAssinatura.delete(assinaturaTABLE,
      
      where: "$assinaturaNameColumn =?",
      whereArgs: [assinaturaName]
    );
  }

 

  Future<List> getAllAssinaturasPorMes(String data)async{//parametro MM/yyyy
    String dataDiaMes = data.substring(0,2);//0,5 MM/yy
    //print("DATA-DIA-MES: $dataDiaMes");
    //print("DATA-PARAM: $data");
    Database dbAssinaturas = await db;
    //List listMap = await dbAssinaturas.rawQuery("SELECT * FROM $assinaturaTABLE WHERE $dataColumn LIKE '%$data%'");
    List listMap = await dbAssinaturas.rawQuery(
      "SELECT * FROM $assinaturaTABLE WHERE ($recorrenciaColumn = 'mensal'  ) "
      +"OR ($recorrenciaColumn ='unica' AND  $dataColumn LIKE '%$data%') "
      +"OR($recorrenciaColumn ='anual' AND  $dataColumn LIKE '%/${dataDiaMes}/%')"
      );
    List<Assinatura> listAssinaturas = List();

    for(Map m in listMap){
      listAssinaturas.add(Assinatura.fromMap(m));
    }
    return listAssinaturas;
  }

  Future close()async{
    Database dbAssinaturas = await db;
    dbAssinaturas.close();
  }
}