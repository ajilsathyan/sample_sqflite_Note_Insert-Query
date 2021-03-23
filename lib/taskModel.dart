import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = "table_1";
final String columnId = "id";
final String columntTitle = "title";
final String columnContent = "content";

class TaskModel {
  final String title;
  final String content;
  final int id;

  TaskModel( 
    this.title,
    this.content,
    this.id,
  );
  Map<String, dynamic> toMap() {
    return {columntTitle: this.title, columnContent: this.content};
  }
}

class DataBaseHelper {
  Database db;
  DataBaseHelper() {
    initDataBase();
  } //initializing Database
  Future<void> initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    db = await openDatabase(join(directory.path, "my_db.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columntTitle TEXT, $columnContent TEXT)");
    }, version: 1);
  }

  //inserting data into the DataBase
  Future<void> insertTask(TaskModel taskModel) async {
    try {
      db.insert(tableName, taskModel.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }

// get All data  from DataBase
  Future<List<TaskModel>> getAllData() async {
    final List<Map<String, dynamic>> tasks = await db.query(tableName);

    return List.generate(tasks.length, (index) {
      return TaskModel(
         tasks[index][columntTitle],
       tasks[index][columnContent],
     tasks[index][columnId]);
    });
  }
}
