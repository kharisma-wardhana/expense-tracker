import 'package:flutter/material.dart';
import 'package:tracker/ui/home/home_page.dart';
import 'package:tracker/ui/onboarding/language_page.dart';
import 'package:tracker/ui/onboarding/onboarding_page.dart';
import 'package:tracker/ui/splash/splash_page.dart';

class RouteConstants {
  RouteConstants._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return _routeTo(SplashPage());
      case OnboardingPage.routeName:
        return _routeTo(OnboardingPage());
      case LanguagePage.routeName:
        return _routeTo(LanguagePage());
      case HomePage.routeName:
        return _routeTo(HomePage());
      default:
        return _routeTo(SplashPage());
    }
  }

  static MaterialPageRoute<dynamic> _routeTo(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
