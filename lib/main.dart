import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:puptask/ui/features/puptask/widgets/puptask_app.dart';
import 'package:puptask/utils/firebase_options.dart';
import 'package:puptask/utils/hive/hive_registrar.g.dart';
import 'package:puptask/utils/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final path = await getApplicationSupportDirectory();
  Hive
    ..init("${path.path}/boxes")
    ..registerAdapters();

  await setUpServices();

  runApp(PuptaskApp(viewModel: sl()));
}
