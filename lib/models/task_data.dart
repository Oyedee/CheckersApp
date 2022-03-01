import 'package:flutter/foundation.dart';
import 'package:checkers/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Ethereum'),
    Task(name: 'Sell Bitcoin'),
    Task(name: 'Buy Buy Gold'),
  ];

  //a getter method
  int get taskCount {
    return tasks.length;
  }
}
