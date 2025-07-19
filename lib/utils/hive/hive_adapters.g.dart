// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class DaysAdapter extends TypeAdapter<Days> {
  @override
  final typeId = 0;

  @override
  Days read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Days.monday;
      case 1:
        return Days.tuesday;
      case 2:
        return Days.wednesday;
      case 3:
        return Days.thursday;
      case 4:
        return Days.friday;
      case 5:
        return Days.saturday;
      case 6:
        return Days.sunday;
      default:
        return Days.monday;
    }
  }

  @override
  void write(BinaryWriter writer, Days obj) {
    switch (obj) {
      case Days.monday:
        writer.writeByte(0);
      case Days.tuesday:
        writer.writeByte(1);
      case Days.wednesday:
        writer.writeByte(2);
      case Days.thursday:
        writer.writeByte(3);
      case Days.friday:
        writer.writeByte(4);
      case Days.saturday:
        writer.writeByte(5);
      case Days.sunday:
        writer.writeByte(6);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[0] as String,
      description: fields[1] as String,
      completed: fields[6] as bool,
      repeatDays: (fields[3] as List?)?.cast<Days>(),
      reminderTime: fields[7] as Duration?,
      dueDate: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.repeatDays)
      ..writeByte(6)
      ..write(obj.completed)
      ..writeByte(7)
      ..write(obj.reminderTime)
      ..writeByte(8)
      ..write(obj.dueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThemeTypeAdapter extends TypeAdapter<ThemeType> {
  @override
  final typeId = 2;

  @override
  ThemeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeType.system;
      case 1:
        return ThemeType.light;
      case 2:
        return ThemeType.dark;
      case 3:
        return ThemeType.midnight;
      default:
        return ThemeType.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeType obj) {
    switch (obj) {
      case ThemeType.system:
        writer.writeByte(0);
      case ThemeType.light:
        writer.writeByte(1);
      case ThemeType.dark:
        writer.writeByte(2);
      case ThemeType.midnight:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final typeId = 3;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      theme: fields[0] as ThemeType,
      isOnboarded: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.theme)
      ..writeByte(1)
      ..write(obj.isOnboarded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
