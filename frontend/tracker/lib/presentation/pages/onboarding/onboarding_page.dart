import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/pages/base_page.dart';
import 'package:tracker/utils/navigation.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController(initialPage: 0);
  int selectedPage = 0;
  double maxWidth = 10;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    selectedPage = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildOnboardingContent(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultPadding * 10),
            width: 180,
            height: 200,
            child: Image.asset(
              'assets/image/splash.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Content Description'),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences _pref =
                        await SharedPreferences.getInstance();
                    _pref.setBool('firstLaunch', true);
                    Navigation.intentReplacement(HomeRoute);
                  },
                  child: Text('Get Started'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeIn,
            );
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            width: selectedPage == index ? maxWidth * 3 : maxWidth,
            height: maxWidth,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: selectedPage == index ? darkSecondaryColor : greyColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildOnboardingContent(index);
              },
              onPageChanged: (index) => setState(() => selectedPage = index),
            ),
            Positioned(
              bottom: 100,
              left: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDotIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
