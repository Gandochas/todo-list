import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_todo_app/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef TaskUpdater =
    Future<void> Function({
      required Task newTask,
      required Task oldTask,
    });

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    unawaited(
      _loadTaskList().then(
        (value) => setState(() {
          _tasks = value;
        }),
      ),
    );
  }

  Future<List<Task>> _loadTaskList() async {
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

  Future<void> _updateTaskList(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTaskList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('task_list', jsonTaskList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _addField() async {
    setState(() {
      _tasks.add(
        Task(name: 'Task ${_tasks.length + 1}', isCompleted: false),
      );
      _updateTaskList(_tasks);
    });
  }

  Future<void> _removeField(Task task) async {
    setState(() {
      _tasks.remove(task);
      _updateTaskList(_tasks);
    });
  }

  Future<void> _changeTask({
    required Task oldTask,
    required Task newTask,
  }) async {
    final index = _tasks.indexOf(oldTask);
    _tasks[index] = newTask;
    await _updateTaskList(_tasks);
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
        onPressed: _addField,
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
                            unawaited(
                              _changeTask(
                                oldTask: _tasks[index],
                                newTask: _tasks[index].copyWith(
                                  isCompleted: value,
                                ),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: TaskTitle(
                            task: _tasks[index],
                            key: ObjectKey(_tasks[index]),
                            update: _changeTask,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await _removeField(_tasks[index]);
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
    required this.task,
    required this.update,
    super.key,
  });

  final Task task;
  final TaskUpdater update;

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  late final TextEditingController _nameController;
  late Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
    _nameController = TextEditingController();
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
        unawaited(
          widget.update(
            oldTask: task,
            newTask: task.copyWith(name: value),
          ),
        );
        task = task.copyWith(name: value);
      },
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: widget.task.name,
      ),
    );
  }
}
