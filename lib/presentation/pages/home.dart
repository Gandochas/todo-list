import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_todo_app/domain/bloc/task/task_bloc.dart';
import 'package:my_todo_app/domain/bloc/theme/theme_bloc.dart';
import 'package:my_todo_app/domain/models/task.dart';

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
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: state.tasks.length,
          itemBuilder: (_, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: TaskListEntry(task: state.tasks[index]),
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
    final taskBloc = context.read<TaskBloc>();
    return Row(
      children: [
        Checkbox(
          value: task.isCompleted,
          checkColor: Colors.black,
          onChanged: (value) {
            taskBloc.add(
              TaskEvent.updateTask(
                task,
                task.copyWith(isCompleted: value ?? false),
              ),
            );
          },
        ),
        Expanded(
          child: TaskTitle(initialTask: task, key: ObjectKey(task)),
        ),
        IconButton(
          onPressed: () => taskBloc.add(TaskEvent.removeTask(task)),
          icon: Icon(Icons.delete_forever, color: Colors.red[700]),
        ),
      ],
    );
  }
}

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            onPressed: () => context.read<ThemeBloc>().add(const ThemeEvent.toggleTheme()),
            icon: Icon(
              state.isDark ? Icons.dark_mode : Icons.light_mode,
              color: state.isDark ? Colors.black : Colors.yellow,
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
            context.read<TaskBloc>().add(TaskEvent.addTask(nameController.text));
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
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
    return TextField(
      controller: _nameController,
      onEditingComplete: () {
        final newTask = _task.copyWith(name: _nameController.text);
        context.read<TaskBloc>().add(TaskEvent.updateTask(_task, newTask));
        _task = newTask;
      },
      decoration: const InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
