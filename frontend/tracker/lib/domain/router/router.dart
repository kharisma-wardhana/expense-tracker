import 'package:flutter/material.dart';
import 'package:tracker/presentation/pages/auth/forgot_password.dart';
import 'package:tracker/presentation/pages/auth/sign_in_page.dart';
import 'package:tracker/presentation/pages/auth/sign_up_page.dart';
import 'package:tracker/presentation/pages/home/home_page.dart';
import 'package:tracker/presentation/pages/splash/splash_page.dart';

const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String SignInRoute = "/signin";
const String SignUpRoute = "/signup";
const String ForgotPasswordRoute = "/forgot_password";

Map<String, WidgetBuilder> listRoute = {
  SplashRoute: (context) => SplashPage(),
  HomeRoute: (context) => HomePage(),
  SignInRoute: (context) => SignInPage(),
  SignUpRoute: (context) => SignUpPage(),
  ForgotPasswordRoute: (context) => ForgotPasswordPage(),
};
