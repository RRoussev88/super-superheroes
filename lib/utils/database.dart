import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Favorite.dart';
import 'constants.dart' as AppConstants;

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  late final Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDB();
    }
    return _database;
  }

  Future<Database> _initDB() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    String path = join(docsDir.path, "HeroesDB.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database dBase, int _) {
      dBase.execute('''
        CREATE TABLE ${AppConstants.DB_FAV_TABLE} (
        ${AppConstants.DB_COLUMN_ID} INTEGER NOT NULL PRIMARY KEY,
        ${AppConstants.DB_COLUMN_IS_FAV} INTEGER NOT NULL)
      ''');
    });
  }

  Future<int> addFavorite(Favorite favorite) async {
    final Database dBase = await database;
    return await dBase.insert(
      AppConstants.DB_FAV_TABLE,
      favorite.toJson(),
      nullColumnHack: '0',
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteFavorite(int id) async {
    final Database dBase = await database;
    return await dBase.delete(
      AppConstants.DB_FAV_TABLE,
      where: '${AppConstants.DB_COLUMN_ID}=?',
      whereArgs: [id],
    );
  }

  Future<List<Favorite>> getFavorite(int id) async {
    final Database dBase = await database;
    List<Map<String, dynamic>> dbFavorites = await dBase.query(
      AppConstants.DB_FAV_TABLE,
      columns: [AppConstants.DB_COLUMN_ID, AppConstants.DB_COLUMN_IS_FAV],
      where: '${AppConstants.DB_COLUMN_ID}=?',
      whereArgs: [id],
      limit: 1,
    );
    return dbFavorites.map((item) => Favorite.fromJson(item)).toList();
  }

  Future<List<Favorite>> getAllFavorites() async {
    final Database dBase = await database;
    List<Map<String, dynamic>> dbFavorites = await dBase.query(
      AppConstants.DB_FAV_TABLE,
      columns: [AppConstants.DB_COLUMN_ID, AppConstants.DB_COLUMN_IS_FAV],
      where: '${AppConstants.DB_COLUMN_IS_FAV}=?',
      whereArgs: [1],
      orderBy: '${AppConstants.DB_COLUMN_ID} ASC',
    );
    return dbFavorites.map((item) => Favorite.fromJson(item)).toList();
  }
}
