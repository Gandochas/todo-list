// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  name: json['name'] as String,
  isCompleted: json['isCompleted'] as bool? ?? false,
  taskId: json['taskId'] as String?,
);

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isCompleted': instance.isCompleted,
      'taskId': instance.taskId,
    };
