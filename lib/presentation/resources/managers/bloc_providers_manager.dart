import 'package:wasla/domain/models/login_models/rive_controller.dart';
import 'package:wasla/presentation/modules/login/cubit/bear_login_animation_cubit.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

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
