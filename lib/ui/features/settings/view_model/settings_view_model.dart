import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puptask/data/repositories/settings_repository.dart';
import 'package:puptask/domain/models/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsViewModel extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  List<String> get themes => ThemeType.values.map((theme) => theme.displayName).toList();
  String get currentTheme => _settingsRepository.settings.theme.displayName;

  SettingsViewModel({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(SettingsInitialState()) {
    on<LoadSettingsEvent>((event, emit) {
      emit(SettingsLoadedState(theme: currentTheme));
    });

    on<ChangeThemeEvent>((event, emit) async {
      try {
        final selectedTheme = ThemeType.values.firstWhere(
          (theme) => theme.displayName == event.value,
          orElse: () => ThemeType.system,
        );
        await _settingsRepository.changeTheme(selectedTheme);
        emit(SettingsLoadedState(theme: currentTheme));
      } catch (e) {
        emit(SettingsErrorState(message: "Failed to update setting: ${e.toString()}"));
      }
    });
  }
  
}