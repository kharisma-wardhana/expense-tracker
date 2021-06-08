part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInit extends LanguageState {
  final Locale locale;

  const LanguageInit(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageLoadedFailed extends LanguageState {
  final String message;

  LanguageLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
