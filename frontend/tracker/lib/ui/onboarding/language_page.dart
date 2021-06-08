import 'package:flutter/material.dart';
import 'package:tracker/shared/router/page_router.dart';
import 'package:tracker/shared/themes/themes.dart';
import 'package:tracker/shared/utils/screen_util.dart';
import 'package:tracker/ui/onboarding/onboarding_page.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);
  static const String routeName = '/language';

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int selectedLang = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenUtil.screenHeight * 0.4,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
            ),
          ),
          Container(
            child: Text("App Tracker"),
          ),
          Spacer(),
          Container(
            width: ScreenUtil.screenWidth * 0.75,
            child: OutlinedButton.icon(
              icon: Image.asset(
                selectedLang == 0
                    ? "assets/images/english_select.png"
                    : "assets/images/english.png",
                fit: BoxFit.contain,
              ),
              onPressed: () {
                setState(() {
                  selectedLang = 0;
                });
              },
              label: Text(
                "English",
                style: TextStyle(
                  color:
                      selectedLang == 0 ? AppColor.secondary : AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    selectedLang == 0 ? AppColor.primary : AppColor.secondary,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: ScreenUtil.screenWidth * 0.75,
            child: OutlinedButton.icon(
              icon: Image.asset(
                selectedLang == 1
                    ? "assets/images/indonesia_select.png"
                    : "assets/images/indonesia.png",
                fit: BoxFit.contain,
              ),
              onPressed: () {
                setState(() {
                  selectedLang = 1;
                });
              },
              label: Text(
                "Indonesian",
                style: TextStyle(
                  color:
                      selectedLang == 1 ? AppColor.secondary : AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    selectedLang == 1 ? AppColor.primary : AppColor.secondary,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 40),
            ),
            onPressed: () {
              PageRouter.pushClearStackNamed(context, OnboardingPage.routeName);
            },
            child: Text("Masuk"),
          ),
        ],
      ),
    );
  }
}
