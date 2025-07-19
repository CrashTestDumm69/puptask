// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
  name: json['name'] as String,
  description: json['description'] as String,
  completed: json['completed'] as bool,
  repeatDays:
      (json['repeatDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DaysEnumMap, e))
          .toList(),
  reminderTime:
      json['reminderTime'] == null
          ? null
          : Duration(microseconds: (json['reminderTime'] as num).toInt()),
  dueDate:
      json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
);

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'completed': instance.completed,
  'repeatDays': instance.repeatDays?.map((e) => _$DaysEnumMap[e]!).toList(),
  'reminderTime': instance.reminderTime?.inMicroseconds,
  'dueDate': instance.dueDate?.toIso8601String(),
};

const _$DaysEnumMap = {
  Days.monday: 'monday',
  Days.tuesday: 'tuesday',
  Days.wednesday: 'wednesday',
  Days.thursday: 'thursday',
  Days.friday: 'friday',
  Days.saturday: 'saturday',
  Days.sunday: 'sunday',
};
