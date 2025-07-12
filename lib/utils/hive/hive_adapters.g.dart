// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(name: fields[0] as String, description: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description);
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

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final typeId = 3;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(theme: fields[2] as ThemeType);
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(1)
      ..writeByte(2)
      ..write(obj.theme);
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

class ThemeTypeAdapter extends TypeAdapter<ThemeType> {
  @override
  final typeId = 6;

  @override
  ThemeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeType.light;
      case 1:
        return ThemeType.dark;
      case 2:
        return ThemeType.system;
      case 3:
        return ThemeType.midnight;
      default:
        return ThemeType.light;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeType obj) {
    switch (obj) {
      case ThemeType.light:
        writer.writeByte(0);
      case ThemeType.dark:
        writer.writeByte(1);
      case ThemeType.system:
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
