import 'package:wasla/presentation/resources/common/common_libs.dart';

part 'onboarding_state.dart';
part 'package:wasla/presentation/modules/onboarding/model/onboarding_model.dart';
part 'package:wasla/presentation/modules/onboarding/model/onboarding_pages.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingInitial(onboardingPages: OnboardingPages()));
}
