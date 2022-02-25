import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final void Function() onPressed;
  final void Function(String?) onChanged;

  AddTaskScreen({required this.onPressed, required this.onChanged});

  @override
  Widget build(BuildContext context) {
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
                onChanged: onChanged,
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
                onPressed: onPressed,
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
