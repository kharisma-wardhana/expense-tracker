import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tracker/shared/constants/language.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit()
      : super(
          LanguageInit(
            Locale(Languages.languages[0].code),
          ),
        );

  Future<void> setLanguage(String languageCode) async {
    Locale _locale = Locale(languageCode);
    emit(LanguageLoaded(_locale));
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    if (json['lang'] != null) {
      String languageCode = json['lang'];
      Locale _locale = Locale(languageCode);
      return (LanguageLoaded(_locale));
    }
    return LanguageLoaded(Locale(Languages.languages[0].code));
  }

  @override
  Map<String, dynamic> toJson(LanguageState state) {
    if (state is LanguageLoaded) {
      return <String, dynamic>{
        'lang': state.locale.languageCode,
      };
    }
    return <String, dynamic>{
      'lang': null,
    };
  }
}
