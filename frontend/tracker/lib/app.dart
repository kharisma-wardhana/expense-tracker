import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/utils/navigation.dart';

import 'presentation/cubit/cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 480),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => injector<AuthCubit>(),
          ),
          BlocProvider<DiscoverCubit>(
            create: (context) => injector<DiscoverCubit>(),
          ),
          BlocProvider<CategoryCubit>(
            create: (context) => injector<CategoryCubit>(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => injector<ThemeCubit>(),
          ),
        ],
        child: TrackerApp(),
      ),
    );
  }
}

class TrackerApp extends StatelessWidget {
  const TrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeData themeData = lightTheme;
        if (state is ThemeHasData) {
          themeData = state.themeData;
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Expense Tracker',
          theme: themeData,
          navigatorKey: navigatorKey,
          routes: listRoute,
          initialRoute: SplashRoute,
        );
      },
    );
  }
}
