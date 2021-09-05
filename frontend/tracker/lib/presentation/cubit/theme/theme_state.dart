part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeHasData extends ThemeState {
  final ThemeData themeData;

  ThemeHasData({required this.themeData});
}
