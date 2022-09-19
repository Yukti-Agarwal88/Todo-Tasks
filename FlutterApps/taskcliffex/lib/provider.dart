import 'dart:collection';
import 'package:flutter/material.dart';
import 'todo_model.dart';

class TodoProvider with ChangeNotifier {
  // change notifier is used because of adding & deleting tasks
  List<TodoModel> tasks = [];

  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(tasks);

  void addTask(String task) {
    //adding a task
    tasks.add(TodoModel(todoTitle: task, completed: false));
    notifyListeners(); // to know what changes have been made
  }

  void toggleTask(TodoModel task) {
    // check completed or not
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    //deleting a task
    tasks.remove(task);
    notifyListeners();
  }
}
