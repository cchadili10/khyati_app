import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/model.dart';

class DatabaseHelper {
  static final _DatabaseName = 'khyati.db';
  static final _dataV = 1;
  static final table = 'size';

  static final colid = "id";
  static final colName = "name";
  // static final colRes_date = "res_date";
  // static final colGive_date = "give_date";
  static final colType = "type";
  static final colType_tob = "type_tob";
  static final colKtaf = "ktaf";
  static final colKom = "kom";
  static final colSdr = "sdr";
  static final colHzam = "hzam";
  static final colTol = "tol";
  static final colTrkiz = "trkiz";
  static final colRas_kom = "ras_kom";
  static final colCol = "col";
  static final colFatha = 'fatha';
  static final colPrice = "price";
  static final colPay = "pay";
  static final colRest = "rest";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initSDatabase();
    return _database;
  }

  _initSDatabase() async {
    Directory dirDoc = await getApplicationDocumentsDirectory();
    String path = join(dirDoc.path, _DatabaseName);
    return await openDatabase(path, version: _dataV, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table(
          $colid INTEGER PRIMARY KEY AUTOINCREMENT ,
          $colName TEXT NOT NULL,
          $colType TEXT,
          $colType_tob TEXT,
          $colKtaf REAL,
          $colKom REAL,
          $colSdr REAL,
          $colHzam REAL,
          $colTol REAL,
          $colTrkiz REAL,
          $colRas_kom REAL,
          $colFatha REAL,
          $colCol REAL,
          $colPrice REAL,
          $colPay REAL,
          $colRest REAL
        )
      ''');
  }

  Future<void> insert(Item item) async {
    // Database? db = await instance.database;
    // return await db!.insert(table, row);
    final db = await database;
    await db?.insert(table, item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Item>> getAll() async {
    // Database? db = await instance.database;
    // return await db!.query(table);
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(table);
    return List.generate(maps.length, (i) {
      return Item(
          id: maps[i]['$colid'],
          name: maps[i]['$colName'],
          type: maps[i]['$colType'],
          type_tob: maps[i]['$colType_tob'],
          ktaf: maps[i]['$colKtaf'],
          kom: maps[i]['$colKom'],
          sdr: maps[i]['$colSdr'],
          hzam: maps[i]['$colHzam'],
          tol: maps[i]['$colTol'],
          trkiz: maps[i]['$colTrkiz'],
          ras_kom: maps[i]['$colRas_kom'],
          fatha: maps[i]['$colFatha'],
          col: maps[i]['$colCol'],
          price: maps[i]['$colPrice'],
          pay: maps[i]['$colPay'],
          rest: maps[i]['$colRest']);
    });
  }

  Future<void> update(Item item) async {
    // Database? db = await instance.database;
    // int id = row[colid];
    // return await db!.update(table, row, where: '$colid = ?', whereArgs: [id]);
    final db = await database;
    await db!.update(table, item.toMap(),
        where: '$colid = ?', whereArgs: [item.id]);
  }


  Future<void> delete(int? id) async {
    // Database? db = await instance.database;
    // return await db!.delete(table, where: '$colid = ?', whereArgs: [id]);
    final db = await database;
    await db!.delete(table, where: '$colid = ?', whereArgs: [id]);
  }



}
