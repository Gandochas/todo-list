import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
final class Task {
  Task({required this.name, required this.isCompleted, String? id})
    : id = id ?? const Uuid().v4();

  factory Task.fromJson(Map<String, Object?> json) {
    return Task(
      name: json['name']! as String,
      isCompleted: json['isCompleted']! as bool,
      id: json['id']! as String,
    );
  }

  final String id;
  final String name;
  final bool isCompleted;

  Map<String, Object?> toJson() => {
    'name': name,
    'isCompleted': isCompleted,
    'id': id,
  };

  Task copyWith({String? name, bool? isCompleted, String? id}) =>
      Task(
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
        id: id ?? this.id,
      );

  @override
  int get hashCode => Object.hashAll([name, isCompleted, id]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other.runtimeType == runtimeType &&
            other is Task &&
            name == other.name &&
            id == other.id &&
            isCompleted == other.isCompleted;
  }
}
