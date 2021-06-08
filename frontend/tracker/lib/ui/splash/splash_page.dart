import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/shared/themes/themes.dart';
import 'package:tracker/ui/cubit/language/language_cubit.dart';
import 'package:tracker/ui/home/home_page.dart';
import 'package:tracker/ui/onboarding/language_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Duration splashTime = Duration(seconds: 3);
  Timer startSplashTime([int? milliseconds]) {
    return Timer(splashTime, handleSplash);
  }

  void handleSplash() {
    // callback function
    Navigator.pushReplacementNamed(context, LanguagePage.routeName);
  }

  @override
  void initState() {
    super.initState();
    startSplashTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: BlocProvider.of<LanguageCubit>(context),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/splash.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("App version"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
