import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_todo_app/data/tasks_datasource.dart';
import 'package:my_todo_app/domain/models/task.dart';

final class TaskController with ChangeNotifier {
  TaskController({required TaskDatasource datasource}) : _datasource = datasource, _tasks = [];

  final TaskDatasource _datasource;

  final List<Task> _tasks;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Future<void> load() async {
    final newList = await _datasource.loadAll();
    _tasks
      ..clear()
      ..addAll(newList);
    notifyListeners();
  }

  Future<void> addTask({required String taskName}) async {
    _tasks.add(Task(name: taskName, isCompleted: false));
    unawaited(_datasource.updateAll(listTask: _tasks));
    notifyListeners();
  }

  Future<void> removeTask({required Task task}) async {
    _tasks.remove(task);
    unawaited(_datasource.updateAll(listTask: _tasks));
    notifyListeners();
  }

  Future<void> updateTask({required Task oldTask, required Task newTask}) async {
    final index = _tasks.indexOf(oldTask);
    _tasks[index] = newTask;
    unawaited(_datasource.updateAll(listTask: _tasks));
    notifyListeners();
  }
}
