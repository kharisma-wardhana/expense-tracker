import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tracker/shared/base/app_localization.dart';

class Application {
  Application({
    required this.theme,
    required this.home,
    required this.router,
    required this.supportsLocale,
    this.cupertinoTheme,
  });

  final ThemeData theme;
  final Widget home;
  final Route<dynamic> Function(RouteSettings setting) router;
  final CupertinoThemeData? cupertinoTheme;
  final List<Locale> supportsLocale;

  Widget materialBuilder(Locale locale) {
    return MaterialApp(
      locale: locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportsLocale,
      theme: theme,
      home: home,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router,
    );
  }

  Widget cupertinoBuilder(Locale locale) {
    return CupertinoApp(
      locale: locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportsLocale,
      theme: cupertinoTheme,
      home: home,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router,
    );
  }
}
