import 'package:hive_ce/hive.dart';
import 'package:puptask/domain/models/settings.dart';

class SettingsStorageService {
  late final Box<Settings> _settingsBox;

  static final Settings defaultSettings = Settings(
    theme: ThemeType.system,
  );

  Future<void> init() async {
    try {
      _settingsBox = await Hive.openBox<Settings>('settings');

      if (_settingsBox.isEmpty) {
        await _settingsBox.put('settings', defaultSettings);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateSettings(Settings settings) async {
    try {
      await _settingsBox.put('settings', settings);
    } catch (e) {
      rethrow;
    }
  }

  Settings getSettings() {
    final settings = _settingsBox.get('settings');
    if (settings == null) {
      return defaultSettings;
    }
    return settings;
  }
}