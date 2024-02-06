import 'package:batata/components/task.dart';

class TaskDao {
  static const String tabelaSql = 'CREATE TABLE $_nomeTabela('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _nomeTabela = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  save() async {}
  Future<List<Task>> findAll() async {}
  Future<List<Task>> find(String nomeDaTarefa) async {}
  delete() async {}
}
