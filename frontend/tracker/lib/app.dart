import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/utils/navigation.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: lightTheme,
        navigatorKey: navigatorKey,
        routes: listRoute,
        initialRoute: SplashRoute,
      ),
    );
  }
}
