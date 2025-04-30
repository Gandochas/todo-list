import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_todo_app/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef TaskUpdater =
    void Function({required Task newTask, required Task oldTask});

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = [];
    unawaited(
      _loadTasksFromMemory().then((tasks) {
        _tasks = tasks;
        setState(() {});
      }),
    );
  }

  Future<List<Task>> _loadTasksFromMemory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList = prefs.getStringList('task_list');

    if (jsonStringList == null) return [];

    return jsonStringList
        .map(
          (jsonString) => Task.fromJson(
            jsonDecode(jsonString) as Map<String, Object?>,
          ),
        )
        .toList();
  }

  Future<void> _updateTasksInMemory(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTaskList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('task_list', jsonTaskList);
  }

  void _addTask() {
    _tasks.add(
      Task(name: 'Task ${_tasks.length + 1}', isCompleted: false),
    );
    unawaited(_updateTasksInMemory(_tasks));
  }

  void _removeTask(Task task) {
    _tasks.remove(task);
    unawaited(_updateTasksInMemory(_tasks));
  }

  void _updateTask({required Task oldTask, required Task newTask}) {
    final index = _tasks.indexOf(oldTask);
    _tasks[index] = newTask;
    unawaited(_updateTasksInMemory(_tasks));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My TODO App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[400],
                    child: Row(
                      children: [
                        Checkbox(
                          value: _tasks[index].isCompleted,
                          onChanged: (value) {
                            _updateTask(
                              oldTask: _tasks[index],
                              newTask: _tasks[index].copyWith(
                                isCompleted: value,
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: TaskTitle(
                            initialTask: _tasks[index],
                            key: ObjectKey(_tasks[index]),
                            updateTask: _updateTask,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _removeTask(_tasks[index]);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskTitle extends StatefulWidget {
  const TaskTitle({
    required this.initialTask,
    required this.updateTask,
    super.key,
  });

  final Task initialTask;
  final TaskUpdater updateTask;

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  late final TextEditingController _nameController;
  late Task _task;

  @override
  void initState() {
    super.initState();
    _task = widget.initialTask;
    _nameController = TextEditingController(text: _task.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      onChanged: (value) {
        final newTask = _task.copyWith(name: value);
        widget.updateTask(
          oldTask: _task,
          newTask: _task.copyWith(name: value),
        );
        _task = newTask;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
