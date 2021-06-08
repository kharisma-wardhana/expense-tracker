import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/shared/router/enter_exit_route.dart';
import 'package:tracker/shared/router/fade_route.dart';
import 'package:tracker/shared/router/scale_route.dart';
import 'package:tracker/shared/router/slide_route.dart';

class PageRouter {
  // https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823

  static void pushClearStackNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void pushClearStack(BuildContext context, Route route) {
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.pushReplacement(context, route);
  }

  static MaterialPageRoute<dynamic> moveTo(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static CupertinoPageRoute<dynamic> cupertinoTo(Widget view) {
    return CupertinoPageRoute(builder: (_) => view);
  }

  static EnterExitRoute enterExitTo(Widget enterView, Widget exitView) {
    return EnterExitRoute(enterPage: enterView, exitPage: exitView);
  }

  static FadeRoute fadeTo(Widget view) {
    return FadeRoute(page: view);
  }

  static ScaleRoute scaleTo(Widget view) {
    return ScaleRoute(page: view);
  }

  static SlideBottomRoute slideBottomTo(Widget view) {
    return SlideBottomRoute(page: view);
  }
}
