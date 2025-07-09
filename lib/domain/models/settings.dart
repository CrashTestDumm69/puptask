import 'package:hive_ce/hive.dart';

enum ThemeType {
  light,
  dark,
  system,
}

class Settings extends HiveObject {
  ThemeType theme;

  Settings({
    required this.theme,
  });

  Settings copyWith({
    ThemeType? theme,
  }) {
    return Settings(
      theme: theme ?? this.theme,
    );
  }
}