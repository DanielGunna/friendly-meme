import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String USER_TABLE = 'user';
const String POST_TABLE = 'post';
const String USER_NAME_COLUMN = 'name';
const String USER_EMAIL_COLUMN = 'email';
const String USER_PASS_COLUMN = 'password';
const String USER_ID_COLUMN = 'id';
const String POST_ID_COLUMN = 'id';
const String POST_USER_ID_COLUMN = 'user_id';
const String POST_CREATED_AT_COLUMN = 'created_at';
const String POST_CONTENT_COLUMN = 'content';

Future<Database> openDatabaseConnection() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await openDatabase(
    join(await getDatabasesPath(), 'boticario_database.db'),
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $USER_TABLE ($USER_ID_COLUMN INTEGER PRIMARY KEY, $USER_NAME_COLUMN TEXT, $USER_EMAIL_COLUMN TEXT, $USER_PASS_COLUMN TEXT)",
      );
      await db.execute(
        "CREATE TABLE $POST_TABLE ($POST_ID_COLUMN INTEGER PRIMARY KEY, $POST_CONTENT_COLUMN TEXT DEFAULT  NULL, $POST_USER_ID_COLUMN INTEGER DEFAULT  NULL,  $POST_CREATED_AT_COLUMN DATE DEFAULT (datetime('now','localtime')) )",
      );
    },
    version: 2,
  );
}
