import 'package:wasla/presentation/resources/common/common_libs.dart';

part 'onboarding_state.dart';
part 'package:wasla/domain/models/onboarding/onboarding_model.dart';
part 'package:wasla/domain/models/onboarding/onboarding_pages.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingInitial(onboardingPages: OnboardingPages()));
}
