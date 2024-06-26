import 'package:wasla/app/shared/common/common_libs.dart';

part 'onboarding_state.dart';
part 'package:wasla/domain/entities/onboarding/onboarding_model.dart';
part 'package:wasla/domain/entities/onboarding/onboarding_pages.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingInitial(onboardingPages: OnboardingPages()));
}

class OnChangeOnBoardingPageCubit extends Cubit<OnChangeOnBoardingPageState> {
  OnChangeOnBoardingPageCubit() : super(const OnChangeOnBoardingPage(index: 0));

  void changeIndex(int index) {
    emit(OnChangeOnBoardingPage(index: index));
  }
}
