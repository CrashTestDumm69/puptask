import 'package:get_it/get_it.dart';
import 'package:puptask/data/repositories/auth_repository.dart';
import 'package:puptask/data/repositories/settings_repository.dart';
import 'package:puptask/data/repositories/task_repository.dart';
import 'package:puptask/data/services/firebase_auth_service.dart';
import 'package:puptask/data/services/settings_storage_service.dart';
import 'package:puptask/data/services/task_storage_service.dart';
import 'package:puptask/ui/features/auth/view_model/auth_view_model.dart';
import 'package:puptask/ui/features/home/view_model/home_view_model.dart';
import 'package:puptask/ui/features/profile/view_model/profile_view_model.dart';
import 'package:puptask/ui/features/puptask/view_model/puptask_view_model.dart';
import 'package:puptask/ui/features/settings/view_model/settings_view_model.dart';

final GetIt sl = GetIt.instance;

Future<void> setUpServices() async {
  sl.registerSingleton(TaskStorageService());
  sl.registerSingleton(TaskRepository(taskStorageService: sl()));
  await sl<TaskRepository>().init();
  sl.registerSingleton(HomeViewModel(taskRepository: sl()));

  sl.registerSingleton(SettingsStorageService());
  sl.registerSingleton(SettingsRepository(storageService: sl()));
  await sl<SettingsRepository>().init();
  sl.registerSingleton(SettingsViewModel(settingsRepository: sl()));
  sl.registerSingleton(PuptaskViewModel(settingsRepository: sl()));

  sl.registerSingleton(FirebaseAuthService());
  sl.registerSingleton(AuthRepository(authService: sl()));
  sl.registerSingleton(AuthViewModel(authRepo: sl()));

  sl.registerSingleton(ProfileViewModel(authRepository: sl()));
}