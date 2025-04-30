import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_todo_app/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    unawaited(_showTasks());
  }

  Future<List<Task>> _getTaskList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList = prefs.getStringList('task_list');

    if (jsonStringList != null) {
      return jsonStringList
          .map(
            (jsonString) => Task.fromJson(
              jsonDecode(jsonString) as Map<String, Object?>,
            ),
          )
          .toList();
    }
    return [];
  }

  Future<void> _updateTaskList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTaskList =
        _tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList('task_list', jsonTaskList);
  }

  Future<void> _showTasks() async {
    _tasks = await _getTaskList();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _addField() async {
    setState(() {
      _tasks.add(Task(name: 'Task ${_tasks.length + 1}'));
      _updateTaskList();
    });
  }

  Future<void> _removeField(Task task) async {
    setState(() {
      _tasks.remove(task);
      _updateTaskList();
    });
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
                            setState(() {
                              _tasks[index].isCompleted =
                                  value ?? false;
                              unawaited(_updateTaskList());
                            });
                          },
                        ),
                        Expanded(
                          child: TaskTitle(
                            task: _tasks[index],
                            key: ObjectKey(_tasks[index]),
                            update: _updateTaskList,
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
  final Future<void> Function() update;

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
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
        setState(() {
          widget.task.name = value;
          unawaited(widget.update());
        });
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
