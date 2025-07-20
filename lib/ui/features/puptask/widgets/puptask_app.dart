import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/domain/models/settings.dart';
import 'package:puptask/routing/router.dart';
import 'package:puptask/ui/core/custom_themes.dart';
import 'package:puptask/ui/features/puptask/view_model/puptask_view_model.dart';

class PuptaskApp extends StatefulWidget {
  final PuptaskViewModel viewModel;

  const PuptaskApp({super.key, required this.viewModel});

  @override
  State<PuptaskApp> createState() => _PuptaskAppState();
}

class _PuptaskAppState extends State<PuptaskApp> {
  @override
  Widget build(BuildContext context) {
    CustomThemes.createTextTheme(context, "Roboto Slab", "Roboto Slab");
    return BlocBuilder<PuptaskViewModel, PuptaskState>(
      bloc: widget.viewModel,
      builder: (context, state) {
        late final ThemeData theme;
        switch (state.theme) {
          case ThemeType.light:
            theme = CustomThemes.light();
          case ThemeType.dark:
            theme = CustomThemes.dark();
          case ThemeType.midnight:
            theme = CustomThemes.midnight();
          case ThemeType.system:
            final brightness =
                View.of(context).platformDispatcher.platformBrightness;
            theme =
                (brightness == Brightness.dark)
                    ? CustomThemes.dark()
                    : CustomThemes.light();
        }

        return MaterialApp.router(
          theme: theme,
          darkTheme: theme,
          routerConfig: router,
        );
      },
    );
  }
}
