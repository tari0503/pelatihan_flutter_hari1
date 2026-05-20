class modelTask {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime creatAt;

  const modelTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.creatAt,
  });

  modelTask copyWith({String? tittle, bool? isCompleted}) {
    return modelTask(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      creatAt: creatAt,
    );
  }
}

enum TaskFilter { all, active, completed }
