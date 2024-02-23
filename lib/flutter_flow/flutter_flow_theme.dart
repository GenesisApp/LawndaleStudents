// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color scriptureRing;
  late Color worshipRing;
  late Color prayerRing;
  late Color notificationBadgeIcon;
  late Color lightSecondaryText;
  late Color prayerAnswered;
  late Color pastorChatOutline;
  late Color textBoxBackground;
  late Color emojiReactionBackground;
  late Color textFieldColorSecondary;
  late Color primaryBtnText;
  late Color lineColor;
  late Color popUpBanners;
  late Color secondayGrey5;
  late Color secondaryGreyKinda;
  late Color navBar;
  late Color boxShadowDarkDM;
  late Color boxShadowLightDM;
  late Color secondaryGrey12;
  late Color secondaryGrey8;
  late Color systemBackground;
  late Color secondarySystemBackground;
  late Color tertiarySystemBackground;
  late Color systemGroupedBackground;
  late Color secondarySystemGroupedBackground;
  late Color tertiarySystemGroupedBackground;
  late Color label;
  late Color secondaryLabel;
  late Color tertiaryLabel;
  late Color quaternaryLabel;
  late Color systemGray;
  late Color systemGray2;
  late Color systemGray3;
  late Color systemGray4;
  late Color systemGray5;
  late Color systemGray6;
  late Color placeholderText;
  late Color separator;
  late Color opagueSeparator;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFFFFFFF);
  late Color secondary = const Color(0xFF46546C);
  late Color tertiary = const Color(0xFF434748);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryText = const Color(0xFF0F1113);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color scriptureRing = Color(0xFF6161B1);
  late Color worshipRing = Color(0xFF37898F);
  late Color prayerRing = Color(0xFFD55C55);
  late Color notificationBadgeIcon = Color(0xFFFF0000);
  late Color lightSecondaryText = Color(0xFF434748);
  late Color prayerAnswered = Color(0xFFAC6E50);
  late Color pastorChatOutline = Color(0xFF8C9DAE);
  late Color textBoxBackground = Color(0xFFBCBABA);
  late Color emojiReactionBackground = Color(0xFF2C394E);
  late Color textFieldColorSecondary = Color(0xFF888888);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color popUpBanners = Color(0xFF2C394E);
  late Color secondayGrey5 = Color(0xFFFFFFFF);
  late Color secondaryGreyKinda = Color(0xFFEEEEEE);
  late Color navBar = Color(0xFFF5F5F5);
  late Color boxShadowDarkDM = Color(0xFF9BBA04);
  late Color boxShadowLightDM = Color(0xFFC99D36);
  late Color secondaryGrey12 = Color(0xFF8E8E8E);
  late Color secondaryGrey8 = Color(0xCCFFFFFF);
  late Color systemBackground = Color(0xFFFFFFFF);
  late Color secondarySystemBackground = Color(0xFFF2F2F7);
  late Color tertiarySystemBackground = Color(0xFFFFFFFF);
  late Color systemGroupedBackground = Color(0xFFF2F2F7);
  late Color secondarySystemGroupedBackground = Color(0xFFFFFFFF);
  late Color tertiarySystemGroupedBackground = Color(0xFFF2F2F7);
  late Color label = Color(0xFF000000);
  late Color secondaryLabel = Color(0xFF3C3C43);
  late Color tertiaryLabel = Color(0xFF3C3C43);
  late Color quaternaryLabel = Color(0xFF3C3C43);
  late Color systemGray = Color(0xFF8E8E93);
  late Color systemGray2 = Color(0xFFAEAEB2);
  late Color systemGray3 = Color(0xFFC7C7CC);
  late Color systemGray4 = Color(0xFFD1D1D6);
  late Color systemGray5 = Color(0xFFE5E5EA);
  late Color systemGray6 = Color(0xFFF2F2F7);
  late Color placeholderText = Color(0xFF3C3C43);
  late Color separator = Color(0xFFC6C6C8);
  late Color opagueSeparator = Color(0x9938383A);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Montserrat';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Montserrat';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Montserrat';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Montserrat',
        color: theme.tertiary,
        fontWeight: FontWeight.w500,
        fontSize: 25.0,
      );
  String get headlineLargeFamily => 'Montserrat';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Montserrat';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Montserrat',
        color: theme.tertiary,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Montserrat';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Montserrat',
        color: theme.tertiary,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Montserrat';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Montserrat';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Montserrat',
        color: theme.tertiary,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Montserrat';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Montserrat',
        color: theme.tertiary,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Montserrat';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Montserrat';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Montserrat';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => 'Inter';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.label,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.label,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get bodySmallFamily => 'Inter';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Inter',
        color: theme.lightSecondaryText,
        fontWeight: FontWeight.w300,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF000000);
  late Color secondary = const Color(0xFF7F95AD);
  late Color tertiary = const Color(0xFFFFFFFF);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF0F1113);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color scriptureRing = Color(0xFF6D6DAE);
  late Color worshipRing = Color(0xFF619B99);
  late Color prayerRing = Color(0xFFFF6961);
  late Color notificationBadgeIcon = Color(0xFFFF0000);
  late Color lightSecondaryText = Color(0x67FEFDFC);
  late Color prayerAnswered = Color(0xFFC27604);
  late Color pastorChatOutline = Color(0xFF7F95AC);
  late Color textBoxBackground = Color(0xFF141920);
  late Color emojiReactionBackground = Color(0xFF171D25);
  late Color textFieldColorSecondary = Color(0xFF384253);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF22282F);
  late Color popUpBanners = Color(0x54535695);
  late Color secondayGrey5 = Color(0x0CFFFFFF);
  late Color secondaryGreyKinda = Color(0x1AFFFFFF);
  late Color navBar = Color(0x06FFFFFF);
  late Color boxShadowDarkDM = Color(0xFF9BBA04);
  late Color boxShadowLightDM = Color(0xFFC99D36);
  late Color secondaryGrey12 = Color(0x1FFFFFFF);
  late Color secondaryGrey8 = Color(0x15FFFFFF);
  late Color systemBackground = Color(0xFF000000);
  late Color secondarySystemBackground = Color(0xFF121212);
  late Color tertiarySystemBackground = Color(0xFF1B1B1B);
  late Color systemGroupedBackground = Color(0xFF000000);
  late Color secondarySystemGroupedBackground = Color(0xFF1C1C1E);
  late Color tertiarySystemGroupedBackground = Color(0xFF2C2C2E);
  late Color label = Color(0xFFFFFFFF);
  late Color secondaryLabel = Color(0xFFEBEBF5);
  late Color tertiaryLabel = Color(0xFFEBEBF5);
  late Color quaternaryLabel = Color(0xFFEBEBF5);
  late Color systemGray = Color(0xFF8E8E93);
  late Color systemGray2 = Color(0xFF636366);
  late Color systemGray3 = Color(0xFF48484A);
  late Color systemGray4 = Color(0xFF3A3A3C);
  late Color systemGray5 = Color(0xFF2C2C2E);
  late Color systemGray6 = Color(0xFF1C1C1E);
  late Color placeholderText = Color(0xFFEBEBF5);
  late Color separator = Color(0xFF98989B);
  late Color opagueSeparator = Color(0x9938383A);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
