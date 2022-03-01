import 'package:flutter/foundation.dart';
import 'package:checkers/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy Ethereum'),
    Task(name: 'Sell Bitcoin'),
    Task(name: 'Buy Buy Gold'),
  ];

  //getter for the task list
  //make the task list unmodifiable
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  //a getter method
  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
}
