import 'package:checkers/models/task.dart';
import 'package:flutter/material.dart';
import 'package:checkers/widgets/tasks_tile.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Task>>(
      valueListenable: Hive.box<Task>('tasks').listenable(),
      builder: (context, tasksBox, _) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = tasksBox.getAt(index) as Task;
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (bool? newCheckboxState) {
                tasksBox.putAt(
                  index,
                  Task(name: task.name, isDone: newCheckboxState!),
                );
              },
              onLongPress: () {
                tasksBox.deleteAt(index);
              },
            );
          },
          itemCount: tasksBox.length,
        );
      },
    );
  }
}
