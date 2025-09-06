import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_todo_app/data/tasks_datasource.dart';
import 'package:my_todo_app/domain/models/task.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required TaskDatasource datasource}) : _datasource = datasource, super(const TaskState()) {
    on<TaskEvent>(
      (event, emit) => event.map(
        loadTasks: (_) => _onTasksLoad(emit),
        addTask: (event) => _onTaskAdd(event, emit),
        removeTask: (event) => _onTaskRemove(event, emit),
        updateTask: (event) => _onTaskUpdate(event, emit),
      ),
    );
  }

  final TaskDatasource _datasource;

  Future<void> _onTasksLoad(Emitter<TaskState> emit) async {
    final tasks = await _datasource.loadAll();
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> _onTaskAdd(_AddTask event, Emitter<TaskState> emit) async {
    final tasks = [...state.tasks, Task(name: event.name, isCompleted: false)];
    unawaited(_datasource.updateAll(listTask: tasks));
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> _onTaskRemove(_RemoveTask event, Emitter<TaskState> emit) async {
    final tasks = [...state.tasks]..remove(event.task);
    unawaited(_datasource.updateAll(listTask: tasks));
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> _onTaskUpdate(_UpdateTask event, Emitter<TaskState> emit) async {
    final tasks = [...state.tasks];
    final index = tasks.indexOf(event.oldTask);
    tasks[index] = event.newTask;
    unawaited(_datasource.updateAll(listTask: tasks));
    emit(state.copyWith(tasks: tasks));
  }
}
