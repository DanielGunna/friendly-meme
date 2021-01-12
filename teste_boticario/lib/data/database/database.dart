import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String USER_TABLE = 'user';
const String POST_TABLE = 'post';
const String USER_NAME_COLUMN = 'name';
const String USER_EMAIL_COLUMN = 'email';
const String USER_PASS_COLUMN = 'password';
const String USER_ID_COLUMN = 'id';

Future<Database> openDatabaseConnection() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await openDatabase(
    join(await getDatabasesPath(), 'boticario.db'),
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $USER_TABLE ($USER_ID_COLUMN INTEGER PRIMARY KEY, $USER_NAME_COLUMN TEXT, $USER_EMAIL_COLUMN TEXT, $USER_PASS_COLUMN TEXT)",
      );
      await db.execute(
        "CREATE TABLE $POST_TABLE (id INTEGER PRIMARY KEY, content TEXT, user_id INTEGER,  created_at DATE DEFAULT (datetime('now','localtime')) )",
      );
    },
    version: 1,
  );
}
