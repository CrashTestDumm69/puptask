import 'package:hive_ce/hive.dart';
import 'package:puptask/domain/models/settings.dart';

import 'package:puptask/domain/models/task/task.dart';

@GenerateAdapters([
  AdapterSpec<Days>(),
  AdapterSpec<Task>(),
  AdapterSpec<ThemeType>(),
  AdapterSpec<Settings>()
])
part 'hive_adapters.g.dart';