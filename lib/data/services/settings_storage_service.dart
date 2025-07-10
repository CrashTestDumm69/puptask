import 'package:hive_ce/hive.dart';
import 'package:puptask/domain/models/settings.dart';

class SettingsStorageService {
  late final Box<Settings> _settingsBox;

  static const String settingsBoxName = 'app_settings';
  static const String settingsKey = 'user_settings';

  static final Settings defaultSettings = Settings(
    theme: ThemeType.system,
  );

  Settings _settings = defaultSettings;
  Settings get settings => _settings;

  Future<void> init() async {
    try {
      _settingsBox = await Hive.openBox<Settings>(settingsBoxName);

      if (_settingsBox.isEmpty) {
        await _settingsBox.put(settingsKey, defaultSettings);
      }

      _settings = _settingsBox.get(settingsKey) ?? defaultSettings;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateSettings(Settings settings) async {
    try {
      await _settingsBox.put(settingsKey, settings);
      _settings = settings;
    } catch (e) {
      rethrow;
    }
  }
}