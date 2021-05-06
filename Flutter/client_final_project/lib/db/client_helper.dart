import 'package:client_final_project/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClientHelper {
  final String clientTable = "Client_table";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String emailColumn = "email_column";

  static final ClientHelper _instance = ClientHelper.internal();

  factory ClientHelper() => _instance;

  ClientHelper.internal();

  Database _db;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "clients.db"); 

    return openDatabase(path, version: 1,
    onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $clientTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, TEXT)"
      );
    });

  }

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  Future<Client> save(Client client) async {
    Database dbClient = await db;
    client.id = await dbClient.insert(clientTable, client.toMap());
  }

  Future<List<Client>> fetchAll() async {
    Database dbClient = await db;
    List listMap = await dbClient.query(
        clientTable,
        columns: [idColumn, nameColumn, emailColumn]
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
}