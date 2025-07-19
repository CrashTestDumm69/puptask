import 'package:hive_ce/hive.dart';

enum ThemeType {
  system,
  light,
  dark,
  midnight
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
      case ThemeType.midnight:
        return 'Midnight';
    }
  }
}

class Settings extends HiveObject {
  ThemeType theme;
  bool isOnboarded;

  Settings({
    required this.theme,
    required this.isOnboarded
  });

  Settings copyWith({ThemeType? theme, bool? isOnboarded}) {
    return Settings(
      theme: theme ?? this.theme,
      isOnboarded: isOnboarded ?? this.isOnboarded
    );
  }
}