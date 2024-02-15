import 'package:batata/components/task.dart';
import 'package:batata/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tabelaSql = 'CREATE TABLE $_nomeTabela('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _nomeTabela = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  save(Task tarefa) async {
    print("Entrou na função save !!");
    Database bancoDeDados = await getDatabase();
    Map<String, dynamic> taskMap = toMap(tarefa);

    var exists = await find(tarefa.nome);
    if (exists.isEmpty) {
      print("A tarefa não existe !");
      bancoDeDados.insert(_nomeTabela, taskMap);
    } else {
      print("A tarefa já existe !!");
      bancoDeDados.update(
        _nomeTabela,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_nomeTabela);
    print("FindALL : ${toList(result)}");
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Map<String, dynamic> toMap(Task tarefa) {
    Map<String, dynamic> mapa = {};
    mapa[_name] = tarefa.nome;
    mapa[_image] = tarefa.foto;
    mapa[_difficulty] = tarefa.dificuldade;
    return mapa;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database bandoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bandoDeDados
        .query(_nomeTabela, where: "$_name = '?' ", whereArgs: [nomeDaTarefa]);
    print("Tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database bandoDeDados = await getDatabase();
    bandoDeDados.delete(
      _nomeTabela,
      where: "$_name = ?",
      whereArgs: [nomeDaTarefa],
    );
  }
}
