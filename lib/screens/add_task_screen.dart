import 'package:checkers/models/task.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = 'Buy Eth';
  @override
  Widget build(BuildContext context) {
    void addTask(Task task) {
      Hive.box<Task>('tasks').add(task);
    }

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Check',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                onPressed: () {
                  final task = Task(name: newTaskTitle);
                  addTask(task);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
