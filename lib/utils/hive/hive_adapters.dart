import 'package:hive_ce/hive.dart';
import 'package:puptask/domain/models/settings.dart';

import 'package:puptask/domain/models/task.dart';

@GenerateAdapters([
  AdapterSpec<Task>(),
  AdapterSpec<Settings>()
])
part 'hive_adapters.g.dart';