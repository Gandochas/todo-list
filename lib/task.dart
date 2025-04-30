class Task {
  Task({required this.name, this.isCompleted = false});

  factory Task.fromJson(Map<String, Object?> json) {
    return Task(
      name: json['name'] as String?,
      isCompleted: json['isCompleted']! as bool,
    );
  }

  String? name;
  bool isCompleted;

  Map<String, Object?> toJson() => {
    'name': name,
    'isCompleted': isCompleted,
  };
}
