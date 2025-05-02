import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_todo_app/data/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class TaskController with ChangeNotifier {
  TaskController({required SharedPreferences preferences})
    : _preferences = preferences,
      _tasks = [];

  final SharedPreferences _preferences;

  List<Task> _tasks;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Future<List<Task>> _fetchAll() async {
    final jsonStringList = _preferences.getStringList('task_list');
    if (jsonStringList == null) return [];

    return jsonStringList.map((line) {
      return Task.fromJson(jsonDecode(line) as Map<String, Object?>);
    }).toList();
  }

  Future<void> _updateAll({required List<Task> tasks}) async {
    final jsonTaskList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await _preferences.setStringList('task_list', jsonTaskList);
  }

  Future<void> load() async {
    final tasks = await _fetchAll();
    _tasks = tasks;
    notifyListeners();
  }

  Future<void> add({required Task task}) async {
    final newList = [..._tasks, task];
    unawaited(_updateAll(tasks: newList));
    _tasks = newList;
    notifyListeners();
  }

  Future<void> remove({required Task task}) async {
    final newList = [..._tasks]..remove(task);
    unawaited(_updateAll(tasks: newList));
    _tasks = newList;
    notifyListeners();
  }

  Future<void> update({required Task oldTask, required Task newTask}) async {
    final index = _tasks.indexOf(oldTask);
    final newList = [..._tasks];
    newList[index] = newTask;
    unawaited(_updateAll(tasks: newList));
    _tasks = newList;
    //notifyListeners();
  }
}
