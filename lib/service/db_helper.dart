import 'package:sqflite/sqflite.dart';
import 'package:sqlite_kontak/model/kontak.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tableKontak';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnMobileNo = 'mobileNo';
  final String columnEmail = 'email';
  final String columnCompany = 'company';

  DbHelper._internal();

  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDb();
    return _database!;
  }

  Future<Database?> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = dbPath + 'kontak.db';
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT,
        $columnMobileNo TEXT,
        $columnEmail TEXT,
        $columnCompany TEXT
      )
    ''');
  }

  Future<int?> saveKontak(Kontak kontak) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, kontak.toMap());
  }

  Future<List?> getAllKontak() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnMobileNo,
      columnEmail,
      columnCompany
    ]);
    return result.toList();
  }

  Future<int?> updateKontak(Kontak kontak) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, kontak.toMap(),
        where: '$columnId = ?', whereArgs: [kontak.id]);
  }

  Future<int?> deleteKontak(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
