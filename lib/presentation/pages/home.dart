import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_todo_app/domain/controller/task_controller.dart';
import 'package:my_todo_app/domain/controller/theme_controller.dart';
import 'package:my_todo_app/domain/models/task.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _openCreateMenu(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const CreateTaskDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('My TODO App'),
        centerTitle: true,
        actions: const [ThemeSwitchButton()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => unawaited(_openCreateMenu(context)),
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: TaskList())],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, taskController, child) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: taskController.tasks.length,
          itemBuilder: (_, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: TaskListEntry(task: taskController.tasks[index]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
        );
      },
    );
  }
}

class TaskListEntry extends StatelessWidget {
  const TaskListEntry({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, taskController, child) {
        return Row(
          children: [
            Checkbox(
              value: task.isCompleted,
              checkColor: Colors.black,
              onChanged: (value) {
                unawaited(
                  taskController.updateTask(
                    oldTask: task,
                    newTask: task.copyWith(isCompleted: value),
                  ),
                );
              },
            ),
            Expanded(
              child: TaskTitle(initialTask: task, key: ObjectKey(task)),
            ),
            IconButton(
              onPressed: () => unawaited(taskController.removeTask(task: task)),
              icon: Icon(Icons.delete_forever, color: Colors.red[700]),
            ),
          ],
        );
      },
    );
  }
}

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, child) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            onPressed: () => unawaited(themeController.switchTheme()),
            icon: Icon(
              themeController.isDark ? Icons.dark_mode : Icons.light_mode,
              color: themeController.isDark ? Colors.black : Colors.yellow,
            ),
          ),
        );
      },
    );
  }
}

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, taskController, child) {
        return AlertDialog(
          title: const Text('Create a new task'),
          content: TextField(
            controller: nameController,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                unawaited(taskController.addTask(taskName: nameController.text));
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }
}

class TaskTitle extends StatefulWidget {
  const TaskTitle({required this.initialTask, super.key});

  final Task initialTask;

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
    return Consumer<TaskController>(
      builder: (context, taskController, child) {
        return TextField(
          controller: _nameController,
          onEditingComplete: () {
            final newTask = _task.copyWith(name: _nameController.text);
            unawaited(taskController.updateTask(oldTask: _task, newTask: newTask));
            _task = newTask;
          },
          decoration: const InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)),
        );
      },
    );
  }
}
