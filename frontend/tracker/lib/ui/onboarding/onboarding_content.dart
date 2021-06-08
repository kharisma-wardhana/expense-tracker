import 'package:flutter/material.dart';
import 'package:tracker/shared/utils/screen_util.dart';
import 'package:tracker/ui/onboarding/onboarding_data.dart';

class OnboardingContent extends StatelessWidget {
  final int index;
  final OnboardingData onboardingData;

  const OnboardingContent({
    Key? key,
    required this.onboardingData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: ScreenUtil.screenHeight * 0.75,
            child: Image.asset(
              onboardingData.contentData[onboardingData.currentPage]["image"]!,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            child: Text(
              onboardingData.contentData[onboardingData.currentPage]["title"]!,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 8),
            height: 8,
            width: onboardingData.currentPage == index ? 32 : 10,
            decoration: BoxDecoration(
              color: onboardingData.currentPage == index
                  ? Colors.blue
                  : Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
