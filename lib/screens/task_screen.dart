import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkers/widgets/tasks_list.dart';
import 'package:checkers/screens/add_task_screen.dart';
import 'package:checkers/models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: 'Buy Ethereum'),
    Task(name: 'Sell Bitcoin'),
    Task(name: 'Buy Buy Gold'),
  ];
  String taskInput = 'Buy Litecoin';
  bool isDismissible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.deepOrangeAccent,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Checkers',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${tasks.length} Checks',
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Ubuntu', fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: TaskList(tasks: tasks),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              onChanged: (newValue) {
                setState(() {
                  taskInput = newValue!;
                });
              },
              onPressed: () {
                setState(() {
                  var newTask = Task(name: taskInput);
                  tasks.add(newTask);
                });
                Navigator.pop(context);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
