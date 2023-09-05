import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbSigom {
  late Database db;

  Future open() async {
    // Get a location using getDatabasesPath

    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'bdsigom.db');

    //join is from path package

    print(path); //output /data/user/0/com.testapp.flutter.testapp/databases/demo.db

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table

      await db.execute(''' 
                  CREATE TABLE IF NOT EXISTS carro (  
                        id primary key, 
                        marca int not null, 
                        cor varchar(8) not null, 
                        ano varchar(4) not null,
                        preco varchar(9) not null,
                        roll_no int not null
                    ); 

                    //create more table here 
                ''');

      print("Tabela Criada com Sucesso!");
    });
  }

  //método de consulta de dados

  Future<Map<dynamic, dynamic>?> getCarros(int rollno) async {
    List<Map> maps =
        await db.query('books', where: 'roll_no = ?', whereArgs: [rollno]);

    //getting student data with roll no.

    if (maps.length > 0) {
      return maps.first;
    }

    return null;
  }
}
