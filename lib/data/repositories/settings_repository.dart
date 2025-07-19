import 'dart:async';

import 'package:puptask/data/services/settings_storage_service.dart';
import 'package:puptask/domain/models/settings.dart';

class SettingsRepository {
  final SettingsStorageService _storageService;
  final StreamController<ThemeType> _themeStreamController = StreamController<ThemeType>.broadcast();
  
  SettingsRepository({
    required SettingsStorageService storageService
  }) : _storageService = storageService;

  Stream<ThemeType> get themeStream => _themeStreamController.stream;
  ThemeType get currentTheme => _storageService.settings.theme;
  bool get isOnboarded => _storageService.settings.isOnboarded;

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
      _themeStreamController.add(theme);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onboardedApp() async {
    try {
      final settings = _storageService.settings;
      await _storageService.updateSettings(settings.copyWith(isOnboarded: true));
    } catch (e) {
      rethrow;
    }
  }
}