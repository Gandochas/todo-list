// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTasks,
    required TResult Function(String name) addTask,
    required TResult Function(Task task) removeTask,
    required TResult Function(Task oldTask, Task newTask) updateTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTasks,
    TResult? Function(String name)? addTask,
    TResult? Function(Task task)? removeTask,
    TResult? Function(Task oldTask, Task newTask)? updateTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTasks,
    TResult Function(String name)? addTask,
    TResult Function(Task task)? removeTask,
    TResult Function(Task oldTask, Task newTask)? updateTask,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTasks value) loadTasks,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_RemoveTask value) removeTask,
    required TResult Function(_UpdateTask value) updateTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTasks value)? loadTasks,
    TResult? Function(_AddTask value)? addTask,
    TResult? Function(_RemoveTask value)? removeTask,
    TResult? Function(_UpdateTask value)? updateTask,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTasks value)? loadTasks,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_RemoveTask value)? removeTask,
    TResult Function(_UpdateTask value)? updateTask,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res, TaskEvent>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res, $Val extends TaskEvent>
    implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTasksImplCopyWith<$Res> {
  factory _$$LoadTasksImplCopyWith(
    _$LoadTasksImpl value,
    $Res Function(_$LoadTasksImpl) then,
  ) = __$$LoadTasksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTasksImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$LoadTasksImpl>
    implements _$$LoadTasksImplCopyWith<$Res> {
  __$$LoadTasksImplCopyWithImpl(
    _$LoadTasksImpl _value,
    $Res Function(_$LoadTasksImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadTasksImpl implements _LoadTasks {
  const _$LoadTasksImpl();

  @override
  String toString() {
    return 'TaskEvent.loadTasks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTasksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTasks,
    required TResult Function(String name) addTask,
    required TResult Function(Task task) removeTask,
    required TResult Function(Task oldTask, Task newTask) updateTask,
  }) {
    return loadTasks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTasks,
    TResult? Function(String name)? addTask,
    TResult? Function(Task task)? removeTask,
    TResult? Function(Task oldTask, Task newTask)? updateTask,
  }) {
    return loadTasks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTasks,
    TResult Function(String name)? addTask,
    TResult Function(Task task)? removeTask,
    TResult Function(Task oldTask, Task newTask)? updateTask,
    required TResult orElse(),
  }) {
    if (loadTasks != null) {
      return loadTasks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTasks value) loadTasks,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_RemoveTask value) removeTask,
    required TResult Function(_UpdateTask value) updateTask,
  }) {
    return loadTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTasks value)? loadTasks,
    TResult? Function(_AddTask value)? addTask,
    TResult? Function(_RemoveTask value)? removeTask,
    TResult? Function(_UpdateTask value)? updateTask,
  }) {
    return loadTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTasks value)? loadTasks,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_RemoveTask value)? removeTask,
    TResult Function(_UpdateTask value)? updateTask,
    required TResult orElse(),
  }) {
    if (loadTasks != null) {
      return loadTasks(this);
    }
    return orElse();
  }
}

abstract class _LoadTasks implements TaskEvent {
  const factory _LoadTasks() = _$LoadTasksImpl;
}

/// @nodoc
abstract class _$$AddTaskImplCopyWith<$Res> {
  factory _$$AddTaskImplCopyWith(
    _$AddTaskImpl value,
    $Res Function(_$AddTaskImpl) then,
  ) = __$$AddTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$AddTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$AddTaskImpl>
    implements _$$AddTaskImplCopyWith<$Res> {
  __$$AddTaskImplCopyWithImpl(
    _$AddTaskImpl _value,
    $Res Function(_$AddTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$AddTaskImpl(
        null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AddTaskImpl implements _AddTask {
  const _$AddTaskImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'TaskEvent.addTask(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTaskImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskImplCopyWith<_$AddTaskImpl> get copyWith =>
      __$$AddTaskImplCopyWithImpl<_$AddTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTasks,
    required TResult Function(String name) addTask,
    required TResult Function(Task task) removeTask,
    required TResult Function(Task oldTask, Task newTask) updateTask,
  }) {
    return addTask(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTasks,
    TResult? Function(String name)? addTask,
    TResult? Function(Task task)? removeTask,
    TResult? Function(Task oldTask, Task newTask)? updateTask,
  }) {
    return addTask?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTasks,
    TResult Function(String name)? addTask,
    TResult Function(Task task)? removeTask,
    TResult Function(Task oldTask, Task newTask)? updateTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTasks value) loadTasks,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_RemoveTask value) removeTask,
    required TResult Function(_UpdateTask value) updateTask,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTasks value)? loadTasks,
    TResult? Function(_AddTask value)? addTask,
    TResult? Function(_RemoveTask value)? removeTask,
    TResult? Function(_UpdateTask value)? updateTask,
  }) {
    return addTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTasks value)? loadTasks,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_RemoveTask value)? removeTask,
    TResult Function(_UpdateTask value)? updateTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class _AddTask implements TaskEvent {
  const factory _AddTask(final String name) = _$AddTaskImpl;

  String get name;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTaskImplCopyWith<_$AddTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveTaskImplCopyWith<$Res> {
  factory _$$RemoveTaskImplCopyWith(
    _$RemoveTaskImpl value,
    $Res Function(_$RemoveTaskImpl) then,
  ) = __$$RemoveTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$RemoveTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$RemoveTaskImpl>
    implements _$$RemoveTaskImplCopyWith<$Res> {
  __$$RemoveTaskImplCopyWithImpl(
    _$RemoveTaskImpl _value,
    $Res Function(_$RemoveTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? task = null}) {
    return _then(
      _$RemoveTaskImpl(
        null == task
            ? _value.task
            : task // ignore: cast_nullable_to_non_nullable
                as Task,
      ),
    );
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$RemoveTaskImpl implements _RemoveTask {
  const _$RemoveTaskImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskEvent.removeTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveTaskImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveTaskImplCopyWith<_$RemoveTaskImpl> get copyWith =>
      __$$RemoveTaskImplCopyWithImpl<_$RemoveTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTasks,
    required TResult Function(String name) addTask,
    required TResult Function(Task task) removeTask,
    required TResult Function(Task oldTask, Task newTask) updateTask,
  }) {
    return removeTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTasks,
    TResult? Function(String name)? addTask,
    TResult? Function(Task task)? removeTask,
    TResult? Function(Task oldTask, Task newTask)? updateTask,
  }) {
    return removeTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTasks,
    TResult Function(String name)? addTask,
    TResult Function(Task task)? removeTask,
    TResult Function(Task oldTask, Task newTask)? updateTask,
    required TResult orElse(),
  }) {
    if (removeTask != null) {
      return removeTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTasks value) loadTasks,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_RemoveTask value) removeTask,
    required TResult Function(_UpdateTask value) updateTask,
  }) {
    return removeTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTasks value)? loadTasks,
    TResult? Function(_AddTask value)? addTask,
    TResult? Function(_RemoveTask value)? removeTask,
    TResult? Function(_UpdateTask value)? updateTask,
  }) {
    return removeTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTasks value)? loadTasks,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_RemoveTask value)? removeTask,
    TResult Function(_UpdateTask value)? updateTask,
    required TResult orElse(),
  }) {
    if (removeTask != null) {
      return removeTask(this);
    }
    return orElse();
  }
}

abstract class _RemoveTask implements TaskEvent {
  const factory _RemoveTask(final Task task) = _$RemoveTaskImpl;

  Task get task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveTaskImplCopyWith<_$RemoveTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTaskImplCopyWith<$Res> {
  factory _$$UpdateTaskImplCopyWith(
    _$UpdateTaskImpl value,
    $Res Function(_$UpdateTaskImpl) then,
  ) = __$$UpdateTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task oldTask, Task newTask});

  $TaskCopyWith<$Res> get oldTask;
  $TaskCopyWith<$Res> get newTask;
}

/// @nodoc
class __$$UpdateTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$UpdateTaskImpl>
    implements _$$UpdateTaskImplCopyWith<$Res> {
  __$$UpdateTaskImplCopyWithImpl(
    _$UpdateTaskImpl _value,
    $Res Function(_$UpdateTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oldTask = null, Object? newTask = null}) {
    return _then(
      _$UpdateTaskImpl(
        null == oldTask
            ? _value.oldTask
            : oldTask // ignore: cast_nullable_to_non_nullable
                as Task,
        null == newTask
            ? _value.newTask
            : newTask // ignore: cast_nullable_to_non_nullable
                as Task,
      ),
    );
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get oldTask {
    return $TaskCopyWith<$Res>(_value.oldTask, (value) {
      return _then(_value.copyWith(oldTask: value));
    });
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get newTask {
    return $TaskCopyWith<$Res>(_value.newTask, (value) {
      return _then(_value.copyWith(newTask: value));
    });
  }
}

/// @nodoc

class _$UpdateTaskImpl implements _UpdateTask {
  const _$UpdateTaskImpl(this.oldTask, this.newTask);

  @override
  final Task oldTask;
  @override
  final Task newTask;

  @override
  String toString() {
    return 'TaskEvent.updateTask(oldTask: $oldTask, newTask: $newTask)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTaskImpl &&
            (identical(other.oldTask, oldTask) || other.oldTask == oldTask) &&
            (identical(other.newTask, newTask) || other.newTask == newTask));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldTask, newTask);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaskImplCopyWith<_$UpdateTaskImpl> get copyWith =>
      __$$UpdateTaskImplCopyWithImpl<_$UpdateTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTasks,
    required TResult Function(String name) addTask,
    required TResult Function(Task task) removeTask,
    required TResult Function(Task oldTask, Task newTask) updateTask,
  }) {
    return updateTask(oldTask, newTask);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTasks,
    TResult? Function(String name)? addTask,
    TResult? Function(Task task)? removeTask,
    TResult? Function(Task oldTask, Task newTask)? updateTask,
  }) {
    return updateTask?.call(oldTask, newTask);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTasks,
    TResult Function(String name)? addTask,
    TResult Function(Task task)? removeTask,
    TResult Function(Task oldTask, Task newTask)? updateTask,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(oldTask, newTask);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTasks value) loadTasks,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_RemoveTask value) removeTask,
    required TResult Function(_UpdateTask value) updateTask,
  }) {
    return updateTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTasks value)? loadTasks,
    TResult? Function(_AddTask value)? addTask,
    TResult? Function(_RemoveTask value)? removeTask,
    TResult? Function(_UpdateTask value)? updateTask,
  }) {
    return updateTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTasks value)? loadTasks,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_RemoveTask value)? removeTask,
    TResult Function(_UpdateTask value)? updateTask,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateTask implements TaskEvent {
  const factory _UpdateTask(final Task oldTask, final Task newTask) =
      _$UpdateTaskImpl;

  Task get oldTask;
  Task get newTask;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTaskImplCopyWith<_$UpdateTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskState {
  List<Task> get tasks => throw _privateConstructorUsedError;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tasks = null}) {
    return _then(
      _value.copyWith(
            tasks:
                null == tasks
                    ? _value.tasks
                    : tasks // ignore: cast_nullable_to_non_nullable
                        as List<Task>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskStateImplCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$$TaskStateImplCopyWith(
    _$TaskStateImpl value,
    $Res Function(_$TaskStateImpl) then,
  ) = __$$TaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TaskStateImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateImpl>
    implements _$$TaskStateImplCopyWith<$Res> {
  __$$TaskStateImplCopyWithImpl(
    _$TaskStateImpl _value,
    $Res Function(_$TaskStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tasks = null}) {
    return _then(
      _$TaskStateImpl(
        tasks:
            null == tasks
                ? _value._tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                    as List<Task>,
      ),
    );
  }
}

/// @nodoc

class _$TaskStateImpl implements _TaskState {
  const _$TaskStateImpl({final List<Task> tasks = const <Task>[]})
    : _tasks = tasks;

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskState(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      __$$TaskStateImplCopyWithImpl<_$TaskStateImpl>(this, _$identity);
}

abstract class _TaskState implements TaskState {
  const factory _TaskState({final List<Task> tasks}) = _$TaskStateImpl;

  @override
  List<Task> get tasks;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
