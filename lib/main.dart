import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:puptask/routing/router.dart';
import 'package:puptask/utils/hive/hive_registrar.g.dart';
import 'package:puptask/utils/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final path = await getApplicationSupportDirectory();
  Hive
    ..init("${path.path}/boxes")
    ..registerAdapters();
  
  await setUpServices();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}