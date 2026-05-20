import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/todo_model.dart';
import 'package:flutter_application_1/views/widget/add_task_field.dart';
import 'package:flutter_application_1/views/widget/filter_bar.dart';
import 'package:flutter_application_1/views/widget/task_list.dart';
import 'package:flutter_application_1/views/widget/task_stats.dart';
import 'package:provider/provider.dart';

class Todopagescreen extends StatelessWidget {
  const Todopagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Todo App'),
        actions: [
          Selector<TodoModel, bool>(
            selector: (context, TodoModel) => TodoModel.hasCompleted,
            builder: (_, hasCompleted, __) => hasCompleted
                ? IconButton(
                    onPressed: () => context.read<TodoModel>().clearCompleted(),
                    icon: Icon(Icons.delete),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
      body: Column(
        children: [AddTaskField(), FilterBar(), TaskStats(), TaskList()],
      ),
    );
  }
}
