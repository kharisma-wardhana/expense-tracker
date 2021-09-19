import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
part 'string_extension.dart';

// Color
const Color primaryColor = Color(0xFFF7F4F7);
const Color secondaryColor = Color(0xFF42224A);
const Color darkPrimaryColor = Color(0xFF120216);
const Color darkSecondaryColor = Color(0xFF6B38FB);
const Color greyColor = Color(0xFF898989);
const Color whiteColor = Color(0xFFE5E5E5);

// Text Theme
final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 92,
    fontWeight: FontWeight.w500,
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w500,
  ),
  headline3: GoogleFonts.poppins(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
  ),
  headline5: GoogleFonts.poppins(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.poppins(
    fontSize: 19,
    fontWeight: FontWeight.w500,
  ),
  subtitle1: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  subtitle2: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  ),
  bodyText1: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyText2: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  button: GoogleFonts.poppins(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.w500,
  ),
  caption: GoogleFonts.libreFranklin(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  overline: GoogleFonts.libreFranklin(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
);

// Size
const double defaultMargin = 32.0;
const double defaultPadding = 18.0;
const double defaultSpacing = 8.0;
const double defaultBorderRadius = 16.0;

ThemeData lightTheme = ThemeData(
  primaryColor: darkSecondaryColor,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: myTextTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: secondaryColor,
    disabledColor: greyColor,
    selectedColor: secondaryColor,
    secondarySelectedColor: darkSecondaryColor,
    padding: const EdgeInsets.all(defaultSpacing),
    labelStyle: TextStyle(),
    secondaryLabelStyle: TextStyle(),
    brightness: Brightness.dark,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: secondaryColor,
    unselectedItemColor: greyColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      textStyle: TextStyle(
        color: primaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: secondaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: myTextTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: darkSecondaryColor,
    disabledColor: greyColor,
    selectedColor: primaryColor,
    secondarySelectedColor: darkSecondaryColor,
    padding: const EdgeInsets.all(defaultSpacing),
    labelStyle: TextStyle(),
    secondaryLabelStyle: TextStyle(),
    brightness: Brightness.dark,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: darkSecondaryColor,
    unselectedItemColor: greyColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: darkSecondaryColor,
      textStyle: TextStyle(
        color: primaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
    ),
  ),
);
