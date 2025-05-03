import 'dart:convert';

import 'package:my_todo_app/domain/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class TaskDatasource {
  Future<List<Task>> loadAll();
  Future<void> updateAll({required List<Task> listTask});
}

base class TaskDatasourceImpl implements TaskDatasource {
  TaskDatasourceImpl({required SharedPreferences preferences}) : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  Future<List<Task>> loadAll() async {
    final jsonStringList = _preferences.getStringList('task_list');

    if (jsonStringList == null) return [];

    return jsonStringList.map((jsonString) => Task.fromJson(jsonDecode(jsonString) as Map<String, Object?>)).toList();
  }

  @override
  Future<void> updateAll({required List<Task> listTask}) async {
    final jsonTaskList = listTask.map((task) => jsonEncode(task.toJson())).toList();
    await _preferences.setStringList('task_list', jsonTaskList);
  }
}
