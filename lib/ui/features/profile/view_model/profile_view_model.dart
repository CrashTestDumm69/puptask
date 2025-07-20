import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/data/repositories/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileViewModel extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository _authRepository;
  ProfileViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(ProfileInitial()) {
    on<LoadProfileEvent>(_loadProfile);
  }

  void _loadProfile(LoadProfileEvent event, Emitter<ProfileState> emit) {
    final user = _authRepository.getCurrentUser();
    if (user != null) {
      emit(ProfileLoaded(user: user));
    } else {
      emit(ProfileUnavailable());
    }
  }
}
