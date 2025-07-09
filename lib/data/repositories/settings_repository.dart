import 'package:puptask/data/services/settings_storage_service.dart';
import 'package:puptask/domain/models/settings.dart';

class SettingsRepository {
  final SettingsStorageService _storageService;

  SettingsRepository(this._storageService);

  Future<void> init() async {
    await _storageService.init();
  }

  Future<void> changeTheme(ThemeType theme) async {
    try {
      final settings = _storageService.getSettings();
      await _storageService.updateSettings(settings.copyWith(theme: theme));
    } catch (e) {
      rethrow;
    }
  }

  Settings getSettings() {
    return _storageService.getSettings();
  }
}