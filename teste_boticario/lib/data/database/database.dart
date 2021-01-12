import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String USER_TABLE = 'user';
final String POST_TABLE = 'post';

Future<Database> openDatabaseConnection() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await openDatabase(
    join(await getDatabasesPath(), 'boticario.db'),
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $USER_TABLE (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)",
      );
      await db.execute(
        "CREATE TABLE $POST_TABLE (id INTEGER PRIMARY KEY, content TEXT, user_id INTEGER,  created_at DATE DEFAULT (datetime('now','localtime')) )",
      );
    },
    version: 1,
  );
}
