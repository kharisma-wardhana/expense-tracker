import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

part 'app_color.dart';
part 'app_font.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      accentColor: AppColor.primaryDark,
      primaryColor: AppColor.primary,
      primaryColorDark: AppColor.primaryDark,
      backgroundColor: AppColor.primaryDark,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    );
  }
}
