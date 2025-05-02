import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_todo_app/data/controller/task_controller.dart';
import 'package:my_todo_app/data/controller/theme_controller.dart';
import 'package:my_todo_app/data/model/task.dart';
import 'package:my_todo_app/presentation/screens/app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _openCreateMenu() {
    return showDialog<void>(
      context: context,
      builder: (context) => const CreateTaskDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('My TODO App'),
        centerTitle: true,
        actions: const [ThemeSwitchButton()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreateMenu,
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

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  late final TextEditingController _nameController;
  late final TaskController _taskController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _taskController = App.dependenciesOf(context).taskController;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create a new task'),
      content: TextField(
        controller: _nameController,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Enter task name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            unawaited(
              _taskController.add(
                task: Task(name: _nameController.text, isCompleted: false),
              ),
            );
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late final TaskController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = App.dependenciesOf(context).taskController;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _taskController,
      builder: (context, _) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: _taskController.tasks.length,
          itemBuilder: (_, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: TaskListEntry(task: _taskController.tasks[index]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
        );
      },
    );
  }
}

class TaskListEntry extends StatefulWidget {
  const TaskListEntry({required this.task, super.key});

  final Task task;

  @override
  State<TaskListEntry> createState() => _TaskListEntryState();
}

class _TaskListEntryState extends State<TaskListEntry> {
  late final TaskController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = App.dependenciesOf(context).taskController;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.task.isCompleted,
          checkColor: Colors.black,
          onChanged: (value) {
            unawaited(
              _taskController.update(
                oldTask: widget.task,
                newTask: widget.task.copyWith(isCompleted: value),
              ),
            );
          },
        ),
        Expanded(
          child: TaskTitle(
            initialTask: widget.task,
            key: ObjectKey(widget.task),
          ),
        ),
        IconButton(
          onPressed: () {
            unawaited(_taskController.remove(task: widget.task));
          },
          icon: Icon(Icons.delete_forever, color: Colors.red[700]),
        ),
      ],
    );
  }
}

class ThemeSwitchButton extends StatefulWidget {
  const ThemeSwitchButton({super.key});

  @override
  State<ThemeSwitchButton> createState() => _ThemeSwitchButtonState();
}

class _ThemeSwitchButtonState extends State<ThemeSwitchButton> {
  late final ThemeController _themeController;

  @override
  void initState() {
    super.initState();
    _themeController = App.dependenciesOf(context).themeController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListenableBuilder(
        listenable: _themeController,
        builder: (context, _) {
          return IconButton(
            onPressed: _themeController.switchTheme,
            icon: Icon(
              _themeController.isDark ? Icons.dark_mode : Icons.light_mode,
              color: _themeController.isDark ? Colors.black : Colors.yellow,
            ),
          );
        },
      ),
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
  late final TaskController _taskController;
  late final TextEditingController _nameController;
  late Task _task;

  @override
  void initState() {
    super.initState();
    _task = widget.initialTask;
    _nameController = TextEditingController(text: _task.name);
    _taskController = App.dependenciesOf(context).taskController;
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
        unawaited(_taskController.update(oldTask: _task, newTask: newTask));
        _task = newTask;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
