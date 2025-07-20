import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puptask/data/repositories/settings_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingViewModel extends Bloc<OnboardingEvent, OnboardingState> {
  final SettingsRepository _settingsRepository;

  OnboardingViewModel({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(OnboardingInitialState());
}
