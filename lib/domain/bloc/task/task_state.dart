part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default(<Task>[]) List<Task> tasks,
  }) = _TaskState;
}
