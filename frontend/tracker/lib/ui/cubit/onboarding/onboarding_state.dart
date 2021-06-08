part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInit extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  final bool firstInstall;

  const OnboardingLoaded(this.firstInstall);

  @override
  List<Object> get props => [firstInstall];
}

class OnboardingLoadedFailed extends OnboardingState {
  final String message;

  OnboardingLoadedFailed(this.message);

  @override
  List<Object> get props => [message];
}
