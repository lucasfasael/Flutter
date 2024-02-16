import 'package:batata/data/taskDAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'database_name.db');
  print('Database path: $path');
  return openDatabase(path, onCreate: (db, version) {
    print('Database created successfully.');
    db.execute(TaskDao.tabelaSql);
  }, version: 1);
}
