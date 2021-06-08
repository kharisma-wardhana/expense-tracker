import 'package:flutter/material.dart';
import 'package:tracker/shared/router/page_router.dart';
import 'package:tracker/ui/cubit/onboarding/onboarding_cubit.dart';
import 'package:tracker/ui/home/home_page.dart';
import 'package:tracker/ui/onboarding/onboarding_content.dart';
import 'package:tracker/ui/onboarding/onboarding_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static const String routeName = '/onboarding';

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
    data.currentPage = 0;
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
                      onPressed: () {
                        setState(() {
                          data.currentPage = data.contentData.length - 1;
                        });
                      },
                      child: Text("Skip"),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () async {
                        if (data.currentPage == data.contentData.length - 1) {
                          await context
                              .read<OnboardingCubit>()
                              .setFirstInstall(true);
                          PageRouter.pushClearStackNamed(
                            context,
                            HomePage.routeName,
                          );
                          return;
                        }
                        setState(() {
                          data.currentPage++;
                        });
                      },
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
