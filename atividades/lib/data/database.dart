import 'package:batata/data/taskDAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath());
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tabelaSql);
  }, version: 1);
}
