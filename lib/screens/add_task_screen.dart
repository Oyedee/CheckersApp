import 'package:checkers/models/task.dart';
import 'package:flutter/material.dart';
import 'package:checkers/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = 'Buy Eth';
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
          child: Flexible(
            fit: FlexFit.loose,
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
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
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
      ),
    );
  }
}
