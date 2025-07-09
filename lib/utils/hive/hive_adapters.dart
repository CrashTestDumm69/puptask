import 'package:hive_ce/hive.dart';

import 'package:puptask/domain/models/task.dart';

@GenerateAdapters([AdapterSpec<Task>()])
part 'hive_adapters.g.dart';