import 'dart:async';
import 'package:path/path.dart';

import 'package:controle_viagens/models/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "usuarios.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $usuarioTable($idCol INTEGER PRIMARY KEY, $nomeCol TEXT, $cpfCol TEXT)");
    });
  }

  Future<Usuario> saveUsuario(Usuario usuario) async {
    Database dbUsuario = await db;
    await dbUsuario.insert(usuarioTable, usuario.toMap());
    return usuario;
  }

  Future<Usuario> getUsuario(int id) async {
    Database dbUsuario = await db;
    List<Map> maps = await dbUsuario.query(usuarioTable,
        columns: [idCol, nomeCol, cpfCol],
        where: "$idCol = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Usuario.fronMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUsuario(int id) async {
    Database dbUsuario = await db;
    return await dbUsuario
        .delete(usuarioTable, where: "$idCol = ?", whereArgs: [id]);
  }

  Future<int> updateUsuario(Usuario usuario) async {
    Database dbUsuario = await db;
    return await dbUsuario.update(usuarioTable, usuario.toMap(),
        where: "$idCol = ?", whereArgs: [usuario.id]);
  }

  Future<List> getAllUsuarios() async {
    Database dbUsuario = await db;
    List listMap = await dbUsuario.rawQuery("SELECT * FROM $usuarioTable");
    List<Usuario> listUsuario = List();
    for (Map m in listMap) {
      listUsuario.add(Usuario.fronMap(m));
    }
    return listUsuario;
  }

  Future<int> getNumber() async {
    Database dbUsuario = await db;
    return Sqflite.firstIntValue(
        await dbUsuario.rawQuery("SELECT COUNT(*) FROM $usuarioTable"));
  }
}
