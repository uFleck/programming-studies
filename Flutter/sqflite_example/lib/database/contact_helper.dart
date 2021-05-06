import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_example/model/model.dart';

class ContactHelper {
  final String contactTable = 'contact_table';
  final String idColumn = 'id_column';
  final String nameColumn = 'name_column';
  final String emailColumn = 'email_column';
  final String phoneColumn = 'phone_column';

  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _database;

  initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'contact.database');

    return openDatabase(path, version: 1, onCreate: (Database database, int newerVersion) async {
      await database.execute(
        'CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $phoneColumn TEXT)'
      );
    });
  }

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  Future close() async {
    Database dbContact = await database;
    dbContact.close();
  }

  Future save(Contact contact) async {
    Database dbContact = await database;
    contact.id = await dbContact.insert(contactTable, contact.toMap()); 
  }

  Future<Contact> findById(int id) async {
    Database dbContact = await database;
    List<Map> maps = await dbContact.query(contactTable, 
      columns: [idColumn, nameColumn, phoneColumn, emailColumn], 
      where: '$idColumn = ?', 
      whereArgs: [id]
    );

    if(maps.length > 0) 
      return Contact.fromMap(maps.first);
    else
      return null;
  }

  Future<int> delete(int id) async {
    Database dbContact = await database;
    return await dbContact.delete(
      contactTable, 
      where: '$idColumn = ?', 
      whereArgs: [id]
    );
  }

  Future<int> update(Contact contact) async {
    Database dbContact = await database;
    return await dbContact.update(
      contactTable, 
      contact.toMap(),
      where: '$idColumn = ?', 
      whereArgs: [contact.id]
    );
  }
}