import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/models/login_models/rive_controller.dart';
import 'package:wasla/presentation/modules/login/cubit/bear_login_animation_cubit.dart';

class BlocProvidersManager {
  static List<BlocProvider> onboardingProviders = [
    BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit()),
    BlocProvider<OnChangeOnBoardingPageCubit>(
        create: (context) => OnChangeOnBoardingPageCubit()),
  ];

  static List<BlocProvider> loginProviders = [
    BlocProvider<BearLoginAnimationCubit>(
        create: (context) => BearLoginAnimationCubit(RiveControllerManager())
          ..loadAndBuildTheAnimation()),
  ];
}
