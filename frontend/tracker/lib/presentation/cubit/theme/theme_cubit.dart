import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/common/style.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> changeTheme({bool isDarkTheme = false}) async {
    emit(ThemeLoading());
    print('CHECKED CHANGE THEME IS DARK = $isDarkTheme');
    ThemeData themeData = isDarkTheme ? darkTheme : lightTheme;
    return emit(ThemeHasData(themeData: themeData));
  }
}
