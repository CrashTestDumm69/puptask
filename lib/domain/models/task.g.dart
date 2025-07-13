// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
  name: json['name'] as String,
  description: json['description'] as String,
  repeat: json['repeat'] as bool,
  repeatDays:
      (json['repeatDays'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DaysEnumMap, e))
          .toList(),
  repeatTimes:
      (json['repeatTimes'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
  dueDates:
      (json['dueDates'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
);

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'repeat': instance.repeat,
  'repeatDays': instance.repeatDays?.map((e) => _$DaysEnumMap[e]!).toList(),
  'repeatTimes': instance.repeatTimes?.map((e) => e.toIso8601String()).toList(),
  'dueDates': instance.dueDates?.map((e) => e.toIso8601String()).toList(),
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
