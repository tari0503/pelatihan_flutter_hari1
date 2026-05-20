import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/model_task.dart';

class TodoModel extends ChangeNotifier {
  final List<modelTask> _task = [];
  TaskFilter _filter = TaskFilter.all;

  TaskFilter get filter => _filter;
  int get activeCount => _task.where((task) => !task.isCompleted).length;
  int get completedCount => _task.where((task) => task.isCompleted).length;

  bool get hasCompleted => completedCount > 0;

  List<modelTask> get filteredTask {
    return switch (_filter) {
      TaskFilter.all => List.unmodifiable(_task),

      TaskFilter.active => _task.where((task) => !task.isCompleted).toList(),

      TaskFilter.completed => _task.where((task) => task.isCompleted).toList(),
    };
  }

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    _task.insert(0, modelTask(
      id: DateTime.now().toString(),
      title: title.trim(),
      creatAt: DateTime.now()
     
    ));

   
    notifyListeners();
  }

  void removeTask(String id) {
    _task.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toogleTask(String id) {
    final index = _task.indexWhere((task) => task.id == id);
    if (index < 0) return;
    _task[index] = _task[index].copyWith(
      isCompleted: !_task[index].isCompleted,
    );
  }

  void clearCompleted() {
    _task.removeWhere((task) => task.isCompleted);
    notifyListeners();
  }

  void setFilter(TaskFilter filter) {
    if (_filter == filter) return;
    _filter = filter;
    notifyListeners();
  }
}
