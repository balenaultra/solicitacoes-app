import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();

  DatabaseHelper.getInstance();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await (_initDb() as Future<Database?>);

    return _db;
  }

  Future<Database?> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'solicitacoes.db');
    print("db $path");

    var db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    //TODO String s = await  rootBundle.loadString("assets/sql/create.sql");
    //
    //List<String> sqls = s.split(";");
    //
    //for (String sql in sqls) {
    //  if (sql.trim().isNotEmpty) {
    //    print(sql);
    //    await db.execute(sql);
    //  }
    //}
  }

  Future<FutureOr<void>> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("_onUpgrade: oldVersion: $oldVersion > newVersion: $newVersion");

    /*if(oldVersion == 1 && newVersion == 2) {
      await db.execute();
    }*/
  }

  Future close() async {
    var dbClient = await (db as FutureOr<Database>);
    return dbClient.close();
  }
}
