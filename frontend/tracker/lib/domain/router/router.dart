import 'package:flutter/material.dart';
import 'package:tracker/presentation/pages/auth/forgot_password.dart';
import 'package:tracker/presentation/pages/auth/sign_in_page.dart';
import 'package:tracker/presentation/pages/auth/sign_up_page.dart';
import 'package:tracker/presentation/pages/home/budget/add_budget_page.dart';
import 'package:tracker/presentation/pages/home/home_page.dart';
import 'package:tracker/presentation/pages/home/profile/edit_profile_page.dart';
import 'package:tracker/presentation/pages/home/settings/settings_page.dart';
import 'package:tracker/presentation/pages/onboarding/onboarding_page.dart';
import 'package:tracker/presentation/pages/splash/splash_page.dart';

const String SplashRoute = "/splash";
const String OnboardingRoute = "/onboarding";
const String HomeRoute = "/home";
const String SignInRoute = "/signin";
const String SignUpRoute = "/signup";
const String ForgotPasswordRoute = "/forgot_password";
const String EditProfileRoute = "/edit_profile";
const String AddBudgetRoute = "/add_budget";
const String SettingsRoute = "/setting";

Map<String, WidgetBuilder> listRoute = {
  SplashRoute: (context) => SplashPage(),
  OnboardingRoute: (context) => OnboardingPage(),
  HomeRoute: (context) => HomePage(),
  SignInRoute: (context) => SignInPage(),
  SignUpRoute: (context) => SignUpPage(),
  ForgotPasswordRoute: (context) => ForgotPasswordPage(),
  EditProfileRoute: (context) => EditProfilePage(),
  AddBudgetRoute: (context) => AddBudgetPage(),
  SettingsRoute: (context) => SettingsPage(),
};
