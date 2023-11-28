import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/login/cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/resources/common/bear_cubit/bear_animation_cubit.dart';

class BlocProvidersManager {
  static List<BlocProvider> onboardingProviders = [
    BlocProvider<OnboardingCubit>(
        create: (context) => getIt<OnboardingCubit>()),
    BlocProvider<OnChangeOnBoardingPageCubit>(
        create: (context) => getIt<OnChangeOnBoardingPageCubit>()),
  ];

  static List<BlocProvider> loginProviders = [
    BlocProvider<BearAnimationCubit>.value(
      value: getIt<BearAnimationCubit>()..loadAndBuildTheAnimation(),
    ),
    BlocProvider<LoginCubit>.value(
      value: getIt<LoginCubit>(),
    ),
    BlocProvider<PasswordIconCubit>.value(
      value: getIt<PasswordIconCubit>(),
    ),
  ];
}
