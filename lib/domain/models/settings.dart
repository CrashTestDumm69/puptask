import 'package:hive_ce/hive.dart';

enum ThemeType {
  light,
  dark,
  system
}

extension ThemeDisplayNameExtension on ThemeType {
  String get displayName {
    switch (this) {
      case ThemeType.light:
        return 'Light';
      case ThemeType.dark:
        return 'Dark';
      case ThemeType.system:
        return 'System';
    }
  }
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