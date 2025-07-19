part of 'profile_view_model.dart';

abstract class ProfileEvent {}

class LoadProfileEvent extends ProfileEvent {}

class AuthChangedEvent extends ProfileEvent {
  final User? user;

  AuthChangedEvent({
    required this.user
  });
}