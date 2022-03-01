import 'package:checkers/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:checkers/screens/task_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:checkers/models/task.dart';
import 'package:checkers/models/task_data.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
