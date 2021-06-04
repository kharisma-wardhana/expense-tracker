import 'package:flutter/material.dart';
import 'package:tracker/shared/utils/screen_util.dart';
import 'package:tracker/ui/onboarding/onboarding_content.dart';
import 'package:tracker/ui/onboarding/onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingData data;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    data = new OnboardingData();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: ScreenUtil.screenHeight * 0.75,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (val) {
                  setState(() {
                    data.currentPage = val;
                  });
                },
                itemCount: data.contentData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  onboardingData: data,
                  index: index,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Skip"),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Next"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
