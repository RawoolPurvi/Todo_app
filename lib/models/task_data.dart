import 'package:flutter/material.dart';
import 'package:todo/models/tasks.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  // make "tasks" a private property to avoid the mistake of not using notifyListener
  final List<Task> _tasks = [
    Task(name: "Complete flutter state management from udemy"),
    Task(name: "Complete riverpod"),
    Task(name: "Complete BLoc"),
  ];

  // Make unmodifiable list view 
  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteData(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}