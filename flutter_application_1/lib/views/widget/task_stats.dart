import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/todo_model.dart';
import 'package:provider/provider.dart';

class TaskStats extends StatelessWidget {
  const TaskStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoModel, (int, int)>(
      selector: (context, TodoModel) =>
          (TodoModel.activeCount, TodoModel.completedCount),
      builder: (_, data, __) {
        final (active, complete) = data;
        return Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 12, 16, 4),
          child: Text(
            '$active Active, $complete Completed',
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        );
      },
    );
  }
}
