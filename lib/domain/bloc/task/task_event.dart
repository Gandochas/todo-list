part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.loadTasks() = _LoadTasks;
  const factory TaskEvent.addTask(String name) = _AddTask;
  const factory TaskEvent.removeTask(Task task) = _RemoveTask;
  const factory TaskEvent.updateTask(Task oldTask, Task newTask) = _UpdateTask;
}
