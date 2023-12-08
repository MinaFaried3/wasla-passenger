import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/modules/register/bloc/check_username_bloc.dart';
import 'package:wasla/presentation/modules/register/cubit/form_index_cubit.dart';
import 'package:wasla/presentation/modules/register/cubit/register_cubit.dart';

class BlocProvidersManager {
  static final List<BlocProvider> onboardingProviders = [
    BlocProvider<OnboardingCubit>(
        create: (context) => getIt<OnboardingCubit>()),
    BlocProvider<OnChangeOnBoardingPageCubit>(
        create: (context) => getIt<OnChangeOnBoardingPageCubit>()),
  ];

  static final List<BlocProvider> loginProviders = [
    BlocProvider<BearAnimationCubit>.value(
      value: getIt<BearAnimationCubit>()..loadAndBuildTheAnimation(),
    ),
    BlocProvider<BearDialogCubit>.value(
      value: getIt<BearDialogCubit>()
        ..writeMessage(AppStrings.loginWelcomeDialog.tr()),
    ),
    BlocProvider<LoginCubit>.value(
      value: getIt<LoginCubit>(),
    ),
    BlocProvider<PasswordIconCubit>.value(
      value: getIt<PasswordIconCubit>(),
    )
  ];

  /*
  *  //todo close it after
  *     try do it in dispose method on widget class
  *     or create a custom dispose method
  * */
  static final List<BlocProvider> registerProviders = [
    BlocProvider<BearAnimationCubit>.value(
      value: getIt<BearAnimationCubit>()..loadAndBuildTheAnimation(),
    ),
    BlocProvider<BearDialogCubit>.value(
      value: getIt<BearDialogCubit>()
        ..writeMessage(AppStrings.registerWelcomeDialog.tr()),
    ),
    BlocProvider<RegisterCubit>.value(
      value: getIt<RegisterCubit>(),
    ),
    BlocProvider<CheckUsernameBloc>.value(
      value: getIt<CheckUsernameBloc>(),
    ),
    BlocProvider<PasswordIconCubit>.value(
      value: getIt<PasswordIconCubit>(),
    ),
    BlocProvider<FormIndexCubit>.value(
      value: getIt<FormIndexCubit>(),
    ),
  ];
}
