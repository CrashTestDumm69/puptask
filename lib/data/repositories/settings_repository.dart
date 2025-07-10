import 'package:puptask/data/services/settings_storage_service.dart';
import 'package:puptask/domain/models/settings.dart';

class SettingsRepository {
  final SettingsStorageService _storageService;

  SettingsRepository({
    required SettingsStorageService storageService
  }) : _storageService = storageService;

  Settings get settings => _storageService.settings;

  Future<void> init() async {
    try {
      await _storageService.init();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeTheme(ThemeType theme) async {
    try {
      final settings = _storageService.settings;
      if (settings.theme == theme) return;

      await _storageService.updateSettings(settings.copyWith(theme: theme));
    } catch (e) {
      rethrow;
    }
  }
}