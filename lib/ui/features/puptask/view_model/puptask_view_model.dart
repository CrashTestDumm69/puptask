import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puptask/data/repositories/settings_repository.dart';

import 'package:puptask/domain/models/settings.dart';

part 'puptask_state.dart';
part 'puptask_event.dart';

class PuptaskViewModel extends Bloc<PuptaskEvent, PuptaskState> {
  final SettingsRepository _settingsRepository;

  PuptaskViewModel({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(PuptaskInitialState(theme: settingsRepository.currentTheme)) {
    on<ThemeChanged>((event, emit) {
      emit(PuptaskThemeChange(theme: event.theme));
    });

    _settingsRepository.themeStream.listen(
      (theme) => add(ThemeChanged(theme: theme)),
    );
  }
}
