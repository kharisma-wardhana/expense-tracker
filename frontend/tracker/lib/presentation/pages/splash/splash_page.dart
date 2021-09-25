import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Duration _splashTime = Duration(seconds: 3);
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    buildNumber: 'Unknown',
    version: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
    _startSplashTime();
  }

  Timer _startSplashTime() {
    return Timer(_splashTime, _handleSplash);
  }

  void _handleSplash() async {
    User? user = FirebaseAuth.instance.currentUser;
    String nextRoute = HomeRoute;
    var _pref = await SharedPreferences.getInstance();
    bool? isFirstLaunch = _pref.getBool('firstLaunch');

    if (isFirstLaunch == null || isFirstLaunch == false) {
      nextRoute = OnboardingRoute;
    } else if (user == null) {
      nextRoute = SignInRoute;
    }
    Navigation.intentReplacement(nextRoute);
  }

  Future<void> _getPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/splash.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: Text('App Version ${_packageInfo.version}'),
            ),
          ),
        ],
      ),
    );
  }
}
