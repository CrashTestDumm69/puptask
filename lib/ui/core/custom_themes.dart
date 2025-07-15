import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static late final TextTheme _textTheme;

  static void createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
    TextTheme baseTextTheme = Theme.of(context).textTheme;
    TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
    TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
    TextTheme textTheme = displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
    _textTheme = textTheme;
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 58, 96, 143),
      surfaceTint: Color.fromARGB(255, 58, 96, 143),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      primaryContainer: Color.fromARGB(255, 211, 227, 255),
      onPrimaryContainer: Color.fromARGB(255, 31, 72, 118),
      secondary: Color.fromARGB(255, 84, 95, 112),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      secondaryContainer: Color.fromARGB(255, 216, 227, 248),
      onSecondaryContainer: Color.fromARGB(255, 60, 71, 88),
      tertiary: Color.fromARGB(255, 109, 86, 119),
      onTertiary: Color.fromARGB(255, 255, 255, 255),
      tertiaryContainer: Color.fromARGB(255, 245, 217, 255),
      onTertiaryContainer: Color.fromARGB(255, 84, 63, 94),
      error: Color.fromARGB(255, 186, 26, 26),
      onError: Color.fromARGB(255, 255, 255, 255),
      errorContainer: Color.fromARGB(255, 255, 218, 214),
      onErrorContainer: Color.fromARGB(255, 147, 0, 10),
      surface: Color.fromARGB(255, 248, 249, 255),
      onSurface: Color.fromARGB(255, 25, 28, 32),
      onSurfaceVariant: Color.fromARGB(255, 67, 71, 78),
      outline: Color.fromARGB(255, 115, 119, 127),
      outlineVariant: Color.fromARGB(255, 195, 198, 207),
      shadow: Color.fromARGB(255, 0, 0, 0),
      scrim: Color.fromARGB(255, 0, 0, 0),
      inverseSurface: Color.fromARGB(255, 46, 48, 53),
      inversePrimary: Color.fromARGB(255, 163, 201, 254),
      primaryFixed: Color.fromARGB(255, 211, 227, 255),
      onPrimaryFixed: Color.fromARGB(255, 0, 28, 56),
      primaryFixedDim: Color.fromARGB(255, 163, 201, 254),
      onPrimaryFixedVariant: Color.fromARGB(255, 31, 72, 118),
      secondaryFixed: Color.fromARGB(255, 216, 227, 248),
      onSecondaryFixed: Color.fromARGB(255, 17, 28, 43),
      secondaryFixedDim: Color.fromARGB(255, 188, 199, 219),
      onSecondaryFixedVariant: Color.fromARGB(255, 60, 71, 88),
      tertiaryFixed: Color.fromARGB(255, 245, 217, 255),
      onTertiaryFixed: Color.fromARGB(255, 38, 20, 48),
      tertiaryFixedDim: Color.fromARGB(255, 217, 189, 227),
      onTertiaryFixedVariant: Color.fromARGB(255, 84, 63, 94),
      surfaceDim: Color.fromARGB(255, 216, 218, 224),
      surfaceBright: Color.fromARGB(255, 248, 249, 255),
      surfaceContainerLowest: Color.fromARGB(255, 255, 255, 255),
      surfaceContainerLow: Color.fromARGB(255, 242, 243, 250),
      surfaceContainer: Color.fromARGB(255, 237, 237, 244),
      surfaceContainerHigh: Color.fromARGB(255, 231, 232, 238),
      surfaceContainerHighest: Color.fromARGB(255, 225, 226, 232),
    );
  }

  static ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 163, 201, 254),
      surfaceTint: Color.fromARGB(255, 163, 201, 254),
      onPrimary: Color.fromARGB(255, 0, 49, 92),
      primaryContainer: Color.fromARGB(255, 31, 72, 118),
      onPrimaryContainer: Color.fromARGB(255, 211, 227, 255),
      secondary: Color.fromARGB(255, 188, 199, 219),
      onSecondary: Color.fromARGB(255, 38, 49, 65),
      secondaryContainer: Color.fromARGB(255, 60, 71, 88),
      onSecondaryContainer: Color.fromARGB(255, 216, 227, 248),
      tertiary: Color.fromARGB(255, 217, 189, 227),
      onTertiary: Color.fromARGB(255, 60, 41, 71),
      tertiaryContainer: Color.fromARGB(255, 84, 63, 94),
      onTertiaryContainer: Color.fromARGB(255, 245, 217, 255),
      error: Color.fromARGB(255, 255, 180, 171),
      onError: Color.fromARGB(255, 105, 0, 5),
      errorContainer: Color.fromARGB(255, 147, 0, 10),
      onErrorContainer: Color.fromARGB(255, 255, 218, 214),
      surface: Color.fromARGB(255, 17, 19, 24),
      onSurface: Color.fromARGB(255, 225, 226, 232),
      onSurfaceVariant: Color.fromARGB(255, 195, 198, 207),
      outline: Color.fromARGB(255, 141, 145, 153),
      outlineVariant: Color.fromARGB(255, 67, 71, 78),
      shadow: Color.fromARGB(255, 0, 0, 0),
      scrim: Color.fromARGB(255, 0, 0, 0),
      inverseSurface: Color.fromARGB(255, 225, 226, 232),
      inversePrimary: Color.fromARGB(255, 58, 96, 143),
      primaryFixed: Color.fromARGB(255, 211, 227, 255),
      onPrimaryFixed: Color.fromARGB(255, 0, 28, 56),
      primaryFixedDim: Color.fromARGB(255, 163, 201, 254),
      onPrimaryFixedVariant: Color.fromARGB(255, 31, 72, 118),
      secondaryFixed: Color.fromARGB(255, 216, 227, 248),
      onSecondaryFixed: Color.fromARGB(255, 17, 28, 43),
      secondaryFixedDim: Color.fromARGB(255, 188, 199, 219),
      onSecondaryFixedVariant: Color.fromARGB(255, 60, 71, 88),
      tertiaryFixed: Color.fromARGB(255, 245, 217, 255),
      onTertiaryFixed: Color.fromARGB(255, 38, 20, 48),
      tertiaryFixedDim: Color.fromARGB(255, 217, 189, 227),
      onTertiaryFixedVariant: Color.fromARGB(255, 84, 63, 94),
      surfaceDim: Color.fromARGB(255, 17, 19, 24),
      surfaceBright: Color.fromARGB(255, 55, 57, 62),
      surfaceContainerLowest: Color.fromARGB(255, 12, 14, 19),
      surfaceContainerLow: Color.fromARGB(255, 25, 28, 32),
      surfaceContainer: Color.fromARGB(255, 29, 32, 36),
      surfaceContainerHigh: Color.fromARGB(255, 39, 42, 47),
      surfaceContainerHighest: Color.fromARGB(255, 50, 53, 58),
    );
  }

  static ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme midnightScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 163, 201, 254),
      surfaceTint: Color.fromARGB(255, 163, 201, 254),
      onPrimary: Color.fromARGB(255, 0, 49, 92),
      primaryContainer: Color.fromARGB(255, 20, 46, 77),
      onPrimaryContainer: Color.fromARGB(255, 211, 227, 255),
      secondary: Color.fromARGB(255, 188, 199, 219),
      onSecondary: Color.fromARGB(255, 38, 49, 65),
      secondaryContainer: Color.fromARGB(255, 60, 71, 88),
      onSecondaryContainer: Color.fromARGB(255, 216, 227, 248),
      tertiary: Color.fromARGB(255, 217, 189, 227),
      onTertiary: Color.fromARGB(255, 60, 41, 71),
      tertiaryContainer: Color.fromARGB(255, 84, 63, 94),
      onTertiaryContainer: Color.fromARGB(255, 245, 217, 255),
      error: Color.fromARGB(255, 255, 180, 171),
      onError: Color.fromARGB(255, 105, 0, 5),
      errorContainer: Color.fromARGB(255, 147, 0, 10),
      onErrorContainer: Color.fromARGB(255, 255, 218, 214),
      surface: Color.fromARGB(255, 0, 0, 0),
      onSurface: Color.fromARGB(255, 225, 226, 232),
      onSurfaceVariant: Color.fromARGB(255, 195, 198, 207),
      outline: Color.fromARGB(255, 141, 145, 153),
      outlineVariant: Color.fromARGB(255, 67, 71, 78),
      shadow: Color.fromARGB(255, 0, 0, 0),
      scrim: Color.fromARGB(255, 0, 0, 0),
      inverseSurface: Color.fromARGB(255, 225, 226, 232),
      inversePrimary: Color.fromARGB(255, 58, 96, 143),
      primaryFixed: Color.fromARGB(255, 211, 227, 255),
      onPrimaryFixed: Color.fromARGB(255, 0, 28, 56),
      primaryFixedDim: Color.fromARGB(255, 163, 201, 254),
      onPrimaryFixedVariant: Color.fromARGB(255, 20, 46, 77),
      secondaryFixed: Color.fromARGB(255, 216, 227, 248),
      onSecondaryFixed: Color.fromARGB(255, 17, 28, 43),
      secondaryFixedDim: Color.fromARGB(255, 188, 199, 219),
      onSecondaryFixedVariant: Color.fromARGB(255, 60, 71, 88),
      tertiaryFixed: Color.fromARGB(255, 245, 217, 255),
      onTertiaryFixed: Color.fromARGB(255, 38, 20, 48),
      tertiaryFixedDim: Color.fromARGB(255, 217, 189, 227),
      onTertiaryFixedVariant: Color.fromARGB(255, 84, 63, 94),
      surfaceDim: Color.fromARGB(255, 0, 0, 0),
      surfaceBright: Color.fromARGB(255, 55, 57, 62),
      surfaceContainerLowest: Color.fromARGB(255, 12, 14, 19),
      surfaceContainerLow: Color.fromARGB(255, 25, 28, 32),
      surfaceContainer: Color.fromARGB(255, 29, 32, 36),
      surfaceContainerHigh: Color.fromARGB(255, 39, 42, 47),
      surfaceContainerHighest: Color.fromARGB(255, 50, 53, 58),
    );
  }

  static ThemeData midnight() {
    return theme(midnightScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: _textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
}
