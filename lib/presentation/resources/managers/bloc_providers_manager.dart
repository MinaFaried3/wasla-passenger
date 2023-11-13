import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/login/cubit/bear_login_animation_cubit.dart';

class BlocProvidersManager {
  static List<BlocProvider> onboardingProviders = [
    BlocProvider<OnboardingCubit>(
        create: (context) => getIt<OnboardingCubit>()),
    BlocProvider<OnChangeOnBoardingPageCubit>(
        create: (context) => getIt<OnChangeOnBoardingPageCubit>()),
  ];

  static List<BlocProvider> loginProviders = [
    BlocProvider<BearLoginAnimationCubit>(
        create: (context) =>
            getIt<BearLoginAnimationCubit>()..loadAndBuildTheAnimation()),
    BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
    )
  ];
}
