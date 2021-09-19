part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeHasData extends ThemeState {
  final ThemeData themeData;

  ThemeHasData({required this.themeData});
}
