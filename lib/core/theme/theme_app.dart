import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// App-wide constants for consistent spacing
class AppSpacing {
  // Base spacing unit (4dp)
  static const double unit = 4.0;

  // Common spacing values
  static const double xs = unit; // 4dp
  static const double sm = unit * 2; // 8dp
  static const double md = unit * 4; // 16dp
  static const double lg = unit * 6; // 24dp
  static const double xl = unit * 8; // 32dp
  static const double xxl = unit * 16; // 64dp
  static const double xxxl = unit * 32; // 128dp
  static const double fourXl = unit * 64; // 128dp
  static const double fiveXl = unit * 128; // 128dp

  // Padding presets
  static const EdgeInsets screenPadding = EdgeInsets.all(md);
  static const EdgeInsets cardPadding = EdgeInsets.all(md);
  static const EdgeInsets buttonPadding =
      EdgeInsets.symmetric(vertical: lg, horizontal: md);
  static const EdgeInsets listItemPadding =
      EdgeInsets.symmetric(vertical: sm, horizontal: md);

  // Margin presets
  static const EdgeInsets sectionMargin =
      EdgeInsets.symmetric(vertical: sm, horizontal: sm);
  static const EdgeInsets itemMargin = EdgeInsets.only(bottom: sm);

  // Border radius
  static const double borderRadiusSm = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;
  static const double borderRadiusXl = 24.0;

  static BorderRadius borderRadiusButton =
      BorderRadius.circular(borderRadiusMd);

  static BorderRadius borderRadiusCardInfo =
      BorderRadius.circular(borderRadiusXl);

  // Card elevation
  static const double cardElevation = 1.0;
}

/// Font and text style definitions
class AppTypography {
  // Font families
  static const String primaryFontFamily = 'SF Pro Display';
  static const String secondaryFontFamily = 'SF Pro Text';

  // Font sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;
  static const double fontSizeXl = 20.0;
  static const double fontSizeXxl = 24.0;
  static const double fontSizeHuge = 32.0;

  // Font weights
  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // Create text styles with color parameter to support both themes
  static TextStyle createHeadingLarge(Color color) => TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: fontSizeXxl,
        fontWeight: weightBold,
        color: color,
      );

  static TextStyle createHeadingMedium(Color color) => TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: fontSizeXl,
        fontWeight: weightBold,
        color: color,
      );

  static TextStyle createHeadingSmall(Color color) => TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: fontSizeLg,
        fontWeight: weightSemiBold,
        color: color,
      );

  static TextStyle createBodyLarge(Color color) => TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: fontSizeMd,
        fontWeight: weightRegular,
        color: color,
      );

  static TextStyle createBodyMedium(Color color) => TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: fontSizeSm,
        fontWeight: weightRegular,
        color: color,
      );

  static TextStyle createBodySmall(Color color) => TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: fontSizeXs,
        fontWeight: weightRegular,
        color: color,
      );

  static TextStyle createButtonText(Color color) => TextStyle(
        fontFamily: primaryFontFamily,
        fontSize: fontSizeMd,
        fontWeight: weightSemiBold,
        color: color,
      );

  static TextStyle createCaptionText(Color color) => TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: fontSizeXs,
        fontWeight: weightMedium,
        color: color,
      );
}

// Theme state
class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}

// Theme cubit
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDarkMode: false));

  ThemeData get currentTheme =>
      state.isDarkMode ? ThemeApp.darkTheme : ThemeApp.lightTheme;

  void toggleTheme() {
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }
}

class ThemeApp {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: AppTypography.primaryFontFamily,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        primaryContainer: primaryContainerColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        background: backgroundColor,
        error: errorColor,
        onPrimary: onPrimaryColor,
        onSecondary: onSecondaryColor,
        onSurface: onSurfaceColor,
        onBackground: onBackgroundColor,
        onError: onErrorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: TextTheme(
        displayLarge: AppTypography.createHeadingLarge(onSurfaceColor),
        displayMedium: AppTypography.createHeadingMedium(onSurfaceColor),
        displaySmall: AppTypography.createHeadingSmall(onSurfaceColor),
        bodyLarge: AppTypography.createBodyLarge(onSurfaceColor),
        bodyMedium: AppTypography.createBodyMedium(greyColor),
        bodySmall: AppTypography.createBodySmall(greyColor),
        labelLarge: AppTypography.createButtonText(primaryColor),
        labelMedium: AppTypography.createButtonText(onSurfaceColor),
        labelSmall: AppTypography.createCaptionText(greyColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        titleTextStyle: AppTypography.createHeadingMedium(onSurfaceColor),
      ),
      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: AppSpacing.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
        ),
        margin: AppSpacing.sectionMargin,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          elevation: 0,
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
          ),
          textStyle: AppTypography.createButtonText(onPrimaryColor),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: AppTypography.primaryFontFamily,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        primaryContainer: primaryContainerColor,
        secondary: secondaryColor,
        surface: Color(0xFF121212),
        error: errorColor,
        onPrimary: onPrimaryColor,
        onSecondary: onSecondaryColor,
        onSurface: Colors.white,
        onError: onErrorColor,
      ),
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      textTheme: TextTheme(
        displayLarge: AppTypography.createHeadingLarge(Colors.white),
        displayMedium: AppTypography.createHeadingMedium(Colors.white),
        displaySmall: AppTypography.createHeadingSmall(Colors.white),
        bodyLarge: AppTypography.createBodyLarge(Colors.white),
        bodyMedium: AppTypography.createBodyMedium(greyColor),
        bodySmall: AppTypography.createBodySmall(greyColor),
        labelLarge: AppTypography.createButtonText(primaryColor),
        labelMedium: AppTypography.createButtonText(Colors.white),
        labelSmall: AppTypography.createCaptionText(greyColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        titleTextStyle: AppTypography.createHeadingMedium(Colors.white),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF121212),
        elevation: AppSpacing.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
        ),
        margin: AppSpacing.sectionMargin,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          elevation: 0,
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
          ),
          textStyle: AppTypography.createButtonText(onPrimaryColor),
        ),
      ),
    );
  }

  // Color constants
  static const Color primaryColor = Color(0xFF1E5631);
  static const Color primaryContainerColor =
      Color(0xFF2E7D32); // 2E7D32 / F2FDF5
  static const Color secondaryColor = Color(0xFFF2FDF5); //757575
  static const Color surfaceColor = Color(0xFFF5F7FA);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = Colors.black;
  static const Color onSurfaceColor = Color(0xFF202124);
  static const Color onBackgroundColor = Color(0xFF202124);
  static const Color onErrorColor = Colors.white;
  static const Color errorColor = Color(0xFFB00020);
  static const Color greyColor = Color(0xFF5F6368);
}

//! this theme is used color scheme seed

// class ThemeApp {
//   static const String primaryFontFamily = 'SF Pro Display';
//   static const String secondaryFontFamily = 'SF Pro Text';

//   static const Color seedColor = Color(0xFF1E5631); // Forest green seed

//   static ThemeData get lightTheme {
//     final colorScheme = ColorScheme.fromSeed(
//       seedColor: seedColor,
//       brightness: Brightness.light,
//     );

//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       fontFamily: primaryFontFamily,
//       colorScheme: colorScheme,
//       scaffoldBackgroundColor: colorScheme.background,
//       textTheme: _textTheme(colorScheme),
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.background,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: IconThemeData(color: colorScheme.primary),
//         titleTextStyle: headingStyle(
//           AppTypography.fontSizeXl,
//           AppTypography.weightBold,
//           colorScheme.onBackground,
//         ),
//       ),
//       cardTheme: CardTheme(
//         color: colorScheme.surface,
//         elevation: AppSpacing.cardElevation,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           foregroundColor: colorScheme.onPrimary,
//           elevation: 0,
//           padding: AppSpacing.buttonPadding,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
//           ),
//         ),
//       ),
//     );
//   }

//   static ThemeData get darkTheme {
//     final colorScheme = ColorScheme.fromSeed(
//       seedColor: seedColor,
//       brightness: Brightness.dark,
//     );

//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       fontFamily: primaryFontFamily,
//       colorScheme: colorScheme,
//       scaffoldBackgroundColor: colorScheme.background,
//       textTheme: _textTheme(colorScheme),
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.background,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: IconThemeData(color: colorScheme.primary),
//         titleTextStyle: headingStyle(
//           AppTypography.fontSizeXl,
//           AppTypography.weightBold,
//           colorScheme.onBackground,
//         ),
//       ),
//       cardTheme: CardTheme(
//         color: colorScheme.surface,
//         elevation: AppSpacing.cardElevation,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           foregroundColor: colorScheme.onPrimary,
//           elevation: 0,
//           padding: AppSpacing.buttonPadding,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppSpacing.borderRadiusMd),
//           ),
//         ),
//       ),
//     );
//   }

//   static TextTheme _textTheme(ColorScheme scheme) {
//     return TextTheme(
//       displayLarge: headingStyle(AppTypography.fontSizeXxl,
//           AppTypography.weightBold, scheme.onSurface),
//       displayMedium: headingStyle(
//           AppTypography.fontSizeXl, AppTypography.weightBold, scheme.onSurface),
//       displaySmall: headingStyle(AppTypography.fontSizeLg,
//           AppTypography.weightSemiBold, scheme.onSurface),
//       bodyLarge: bodyStyle(AppTypography.fontSizeMd,
//           AppTypography.weightRegular, scheme.onSurface),
//       bodyMedium: bodyStyle(AppTypography.fontSizeSm,
//           AppTypography.weightRegular, scheme.onSurface.withOpacity(0.8)),
//       bodySmall: bodyStyle(AppTypography.fontSizeXs,
//           AppTypography.weightRegular, scheme.onSurface.withOpacity(0.6)),
//       labelLarge: bodyStyle(AppTypography.fontSizeMd,
//           AppTypography.weightSemiBold, scheme.primary),
//       labelMedium: bodyStyle(AppTypography.fontSizeSm,
//           AppTypography.weightSemiBold, scheme.onSurface),
//       labelSmall: bodyStyle(AppTypography.fontSizeXs,
//           AppTypography.weightMedium, scheme.onSurface.withOpacity(0.6)),
//     );
//   }

//   static TextStyle headingStyle(double size, FontWeight weight, Color color) {
//     return TextStyle(
//       fontFamily: primaryFontFamily,
//       fontSize: size,
//       fontWeight: weight,
//       color: color,
//     );
//   }

//   static TextStyle bodyStyle(double size, FontWeight weight, Color color) {
//     return TextStyle(
//       fontFamily: secondaryFontFamily,
//       fontSize: size,
//       fontWeight: weight,
//       color: color,
//     );
//   }
// }
