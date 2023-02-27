import 'dart:io';

import 'package:fluttersimhosting/app/database/databasemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../utils/strings.dart';



Future<String> pathstring() async {
  final Directory databasesPath = await getApplicationDocumentsDirectory();
  return join(databasesPath.path, "pengassan.db");
}
Future<Database> Databasequary() async {
  var path = await pathstring();
  var databaseFactory = databaseFactoryFfi;
    final database = await databaseFactory.openDatabase(path,options: OpenDatabaseOptions(
         version: 1,onCreate: (database, version){
       database.execute(
        'CREATE TABLE ${databasename.TABLE_PROCESS}('
            '${databasename.COLUMN_PROCESSID} INTEGER PRIMARY KEY AUTOINCREMENT, '
            '${databasename.COLUMN_TYPE} TEXT, '
            '${databasename.COLUMN_CODE} TEXT, '
            '${databasename.COLUMN_RESPONSE} TEXT, '
            '${databasename.COLUMN_PROCESSREFRENCE} TEXT, '
            '${databasename.COLUMN_SEEN} TEXT, '
            '${databasename.COLUMN_UPLOAD} TEXT DEFAULT 0, '
            '${databasename.COLUMN_TIMESTAMP} TEXT)',
      );
    }));
  return database;
}


// Define a function that inserts dogs into the database
Future<int> insertContact(dog, dogs) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  return await db.insert(
    dogs,
    dog.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves specific the dogs from the dogs table.
Future<List> fetchspecificContact(
    String condition, List number, String dogs) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query(
    dogs,
    // Ensure that the Dog has a matching id.
    where: condition,
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: number,
  );

  return maps;
}

// A method that retrieves specific the dogs from the dogs table.
Future<List> fetchdistintContact(
    String tablename, String columns) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.rawQuery(
   "SELECT DISTINCT $tablename FROM $columns"
  );

  return maps;
}

// A method that retrieves all the dogs from the dogs table.
Future<List> fetchallContact(tablename) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query(tablename);

  return maps;
} // A method that retrieves all the dogs from the dogs table.

Future<void> insertsingleContact(tablename, columns, values) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // await db.rawInsert('INSERT INTO my_table(name, age) VALUES($name, $age)');
  await db.rawInsert('INSERT INTO $tablename $columns VALUES$values');
}

Future<void> updateContact(Databasemodel dog) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toJson(),
    // Ensure that the Dog has a matching id.
    where: 'number = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.response],
  );
}

Future<void> updateupload(Databasemodel dog) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toJson(),
    // Ensure that the Dog has a matching id.
    where: 'number = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.response],
  );
}

Future<void> updateseen(Databasemodel dog) async {
  // Get a reference to the database.
  final db = await Databasequary();

  // Update the given Dog.
  await db.update(
    databasename.TABLE_PROCESS,
    dog.toJson(),
    // Ensure that the Dog has a matching id.
    where: '${databasename.COLUMN_PROCESSID} = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.processId],
  );
}

// Future<void> emptyContact(dog) async {
//   // Get a reference to the database.
//   var databasesPath = await getDatabasesPath();
//   var path = join(databasesPath, "mcd_database.db");
//   if (await databaseExists(path)) {
//     final db = await Databasequary();
//     // Delete the given Table.
//     await db.rawQuery("delete from $dog");
//   }
// }

// Future<void> deletedatabase() async {
//   // Get a reference to the database.
//   var databasesPath = await getDatabasesPath();
//   var path = join(databasesPath, "mcd_database.db");
//   if (await databaseExists(path)) {
//     final db = await Databasequary();
// // delete existing if any
//     await deleteDatabase(path);
//   }
// }
Future<void> deletedatabase() async {
  // Get a reference to the database.
  // var databasesPath = await getDatabasesPath();

  var path = await pathstring();
  if (File(path).exists() == true) {
    File(path).delete();
    // final db = await Databasequary();
// delete existing if any
//     await deleteDatabase(path);
  }
}

Future<void> deletetable(tablename) async {
  final db = await Databasequary();
  await db.execute("DROP TABLE IF EXISTS $tablename");
}
Future<void> emptytable(tablename) async {
  final db = await Databasequary();
  var list = await fetchallContact(tablename);
  if (list.isNotEmpty) {
    await db.execute("DELETE FROM $tablename");
  }
}
