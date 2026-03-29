import 'package:flutter/material.dart';
import 'TaskTile.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class TaskView extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    //to show that we can build as many list items as we want
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context,index){
          final task = taskData.tasks[index];
        return TaskTile(
          // taskTitle: context.watch<TaskData>().tasks[index].name, //the 'tasks' is in the higher level i.e. taskscreen.dart
          // isChecked: context.watch<TaskData>().tasks[index].isDone,t
          taskTitle: task.name, 
          isChecked: task.isDone,
          checkBoxCallback : (bool? checkboxState){
            taskData.updateTask(task);
          },
          longPressCallback: (){
            taskData.deleteData(task);
          },
        );
      },
      // itemCount: context.watch<TaskData>().tasks.length, //to print as many tasks as we have
      itemCount: taskData.taskCount, 
      );
      },
    );
  }
}
