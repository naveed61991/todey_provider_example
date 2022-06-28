import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return ListTile(
            title: Text(
              taskData.tasks[index].name,
              style: TextStyle(
                  decoration: taskData.tasks[index].isDone
                      ? TextDecoration.lineThrough
                      : null),
            ),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (newValue) {
                taskData.updateTask(task);
              },
            ),
            onLongPress: () {
              taskData.deleteTask(task);
            },
          );
        },
      );
    });
  }
}
