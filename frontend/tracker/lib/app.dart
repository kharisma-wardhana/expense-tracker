import 'package:flutter/material.dart';
import 'package:tracker/shared/base/application.dart';
import 'package:tracker/shared/constants/language.dart';
import 'package:tracker/shared/constants/route_constant.dart';
import 'package:tracker/shared/themes/themes.dart';
import 'package:tracker/shared/utils/screen_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/ui/cubit/language/language_cubit.dart';
import 'package:tracker/ui/cubit/onboarding/onboarding_cubit.dart';
import 'package:tracker/ui/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    final app = Application(
      theme: AppTheme.themeData(context),
      home: SplashPage(),
      router: RouteConstants.generateRoute,
      supportsLocale: Languages.languages.map((e) => Locale(e.code)).toList(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => OnboardingCubit()),
      ],
      child: app.materialBuilder(Locale("en")),
    );
  }
}
