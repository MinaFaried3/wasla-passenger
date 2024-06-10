import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/cubit/edit_contacts_cubit.dart';
import 'package:wasla/presentation/modules/home/home/cubit/home_cubit.dart';
import 'package:wasla/presentation/modules/home/main/cubit/main_home_cubit.dart';
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

  static final List<BlocProvider> _authProviders = [
    BlocProvider<BearAnimationCubit>.value(
      value: getIt<BearAnimationCubit>()..loadAndBuildTheAnimation(),
    ),
    BlocProvider<BearDialogCubit>.value(
      value: getIt<BearDialogCubit>()
        ..writeMessage(AppStrings.loginWelcomeDialog.tr()),
    ),
  ];

  static final List<BlocProvider> loginProviders = [
    ..._authProviders,
    BlocProvider<LoginCubit>.value(
      value: getIt<LoginCubit>(),
    ),
  ];

  /*
  *  //todo close it after
  *     try do it in dispose method on widget class
  *     or create a custom dispose method
  * */
  static final List<BlocProvider> registerProviders = [
    ..._authProviders,
    BlocProvider<RegisterCubit>.value(
      value: getIt<RegisterCubit>(),
    ),
    BlocProvider<CheckUsernameBloc>.value(
      value: getIt<CheckUsernameBloc>(),
    ),
    BlocProvider<FormIndexCubit>.value(
      value: getIt<FormIndexCubit>(),
    ),
  ];

  static final List<BlocProvider> verificationProviders = [
    BlocProvider<EditContactsCubit>.value(value: getIt<EditContactsCubit>()),
  ];

  static final List<BlocProvider> homeProviders = [
    BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
    BlocProvider<MainHomeCubit>(
        create: (context) => getIt<MainHomeCubit>()..getSuggestionsTrips()),
    // BlocProvider<ProfileCubit>(
    //     create: (context) => getIt<ProfileCubit>()..getProfile()),
  ];
}
