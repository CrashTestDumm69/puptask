part of 'profile_view_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUnavailable extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;

  ProfileLoaded({
    required this.user
  });
}