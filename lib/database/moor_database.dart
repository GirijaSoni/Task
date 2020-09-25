import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:testapp/models/bank.dart';

// Moor works by source gen. This file will all the generated code.
part 'moor_database.g.dart';

// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Favs extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get bank => text().map(const CustomConverter())();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
//  TextColumn get name => text().withLength(min: 1, max: 50)();
//  // DateTime is not natively supported by SQLite
//  // Moor converts it to & from UNIX seconds
//  DateTimeColumn get dueDate => dateTime().nullable()();
//  // Booleans are not supported as well, Moor converts them to integers
//  // Simple default values are specified as Constants
//  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Favs])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
  // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite', logStatements: true,)));


  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;
  Future<List<Fav>> getAllFavs() => select(favs).get();
  Stream<List<Fav>> watchAllFavs() => select(favs).watch();
  Future insertFav(Fav fav) =>into(favs).insert(fav);
  Future deleteFav(Fav fav) =>delete(favs).delete(fav);
}




class CustomConverter extends TypeConverter<Bank, String> {
  const CustomConverter();
  @override
  Bank mapToDart(String fromDb) {
    return fromDb == null ? null : Bank.fromJson(json.decode(fromDb));
  }
  @override
  String mapToSql(Bank value) {
    return json.encode(value.toJson());
  }
}