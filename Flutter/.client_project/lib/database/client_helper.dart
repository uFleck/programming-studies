import 'package:client_project/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClientHelper {

  final String clientTable = "client_table";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String cpfColumn = "cpf_column";

  static final ClientHelper _instance = ClientHelper.internal();

  factory ClientHelper() => _instance;

  ClientHelper.internal();

  Database _database;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "client.db");

    return openDatabase(path, version: 1,
    onCreate: (Database database, int newerVersion) async {
      await database.execute(
        "CREATE TABLE $clientTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $cpfColumn TEXT)"
      );
    });

  }

  Future<Database> get database async {
    if(_database != null)
      return _database;
    _database = await initDb();
    return _database;
  }
  
  Future save(Client client) async {
    Database databaseClient = await database;
    client.id = await databaseClient.insert(clientTable, client.toMap());
  }

  Future<List<Client>> fetchAll() async {
    Database databaseClient = await database;
    List listMap = await databaseClient.query(
        clientTable,
        columns: [idColumn, nameColumn, cpfColumn]
    );

    List<Client> listClient = [];

    for(Map map in listMap) {
      listClient.add(Client.fromMap(map));
    }

    if(listClient.isNotEmpty)
      return listClient;
    else
      return null;
  }

  Future<int> getSize() async {
    Database databaseClient = await database;
    return Sqflite.firstIntValue(await databaseClient.rawQuery("select count(*) from $clientTable"));
  }

}