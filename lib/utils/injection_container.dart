import 'package:get_it/get_it.dart';
import 'package:puptask/data/repositories/task_repository.dart';
import 'package:puptask/data/services/task_storage_service.dart';
import 'package:puptask/ui/features/home/view_model/home_view_model.dart';

final GetIt sl = GetIt.instance;

Future<void> setUpServices() async {
  sl.registerSingleton(TaskStorageService());
  sl.registerSingleton(TaskRepository(taskStorageService: sl()));
  await sl<TaskRepository>().init();
  sl.registerSingleton(HomeViewModel(taskRepository: sl()));
}