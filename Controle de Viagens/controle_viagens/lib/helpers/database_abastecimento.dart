import 'dart:async';
import 'package:path/path.dart';

import 'package:controle_viagens/models/abastecimento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseAbastecimento {
  static final DatabaseAbastecimento _instance =
      DatabaseAbastecimento.internal();

  factory DatabaseAbastecimento() => _instance;

  DatabaseAbastecimento.internal();

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
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "abastecimentos.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $abastecimentoTable($idCol INTEGER PRIMARY KEY, $nomePostoCol TEXT, $cidadeCol TEXT, $dataAbtCol TEXT, $horarioAbtCol TEXT, $odometroAbtCol TEXT, $qntCombusCol TEXT)");
    });
  }

  Future<Abastecimento> saveAbastecimento(Abastecimento abastecimento) async {
    Database dbAbastecimento = await db;
    await dbAbastecimento.insert(abastecimentoTable, abastecimento.toMap());
    return abastecimento;
  }

  Future<Abastecimento> getAbastecimento(int id) async {
    Database dbAbastecimento = await db;
    List<Map> maps = await dbAbastecimento.query(abastecimentoTable,
        columns: [
          idCol,
          nomePostoCol,
          cidadeCol,
          dataAbtCol,
          horarioAbtCol,
          odometroAbtCol,
          qntCombusCol
        ],
        where: "$idCol = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Abastecimento.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteAbastecimento(int id) async {
    Database dbAbastecimento = await db;
    return await dbAbastecimento
        .delete(abastecimentoTable, where: "$idCol = ?", whereArgs: [id]);
  }

  Future<int> updateAbastecimento(Abastecimento abastecimento) async {
    Database dbAbastecimento = await db;
    return await dbAbastecimento.update(
      abastecimentoTable,
      abastecimento.toMap(),
      where: "$idCol = ?",
      whereArgs: [abastecimento.id],
    );
  }

  Future<List> getAllAbastecimentos() async {
    Database dbAbastecimento = await db;
    List listMap =
        await dbAbastecimento.rawQuery("SELECT * FROM $abastecimentoTable");
    List<Abastecimento> listAbastecimento = List();
    for (Map m in listMap) {
      listAbastecimento.add(Abastecimento.fromMap(m));
    }
    return listAbastecimento;
  }

  Future<int> getNumber() async {
    Database dbAbastecimento = await db;
    return Sqflite.firstIntValue(await dbAbastecimento
        .rawQuery("SELECT COUNT(*) FROM $abastecimentoTable"));
  }

  close() async {
    Database dbAbastecimento = await db;
    dbAbastecimento.close();
  }
}
