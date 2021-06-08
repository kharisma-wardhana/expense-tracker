import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends HydratedCubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInit());

  Future<void> setFirstInstall(bool firstInstall) async {
    emit(OnboardingLoaded(firstInstall));
  }

  @override
  OnboardingState fromJson(Map<String, dynamic> json) {
    if (json['firstInstall'] != null) {
      bool firstInstall = json['firstInstall'];
      return (OnboardingLoaded(firstInstall));
    }
    return OnboardingInit();
  }

  @override
  Map<String, dynamic> toJson(OnboardingState state) {
    if (state is OnboardingLoaded) {
      return <String, dynamic>{
        'firstInstall': state.firstInstall,
      };
    }
    return <String, dynamic>{
      'firstInstall': false,
    };
  }
}
