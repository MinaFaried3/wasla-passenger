import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/services.dart';
import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/next_button.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/page_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return PopScope(
      onPopInvoked: (pop) {
        SystemNavigator.pop();
      },
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingInitial) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: BlocBuilder<OnChangeOnBoardingPageCubit,
                  OnChangeOnBoardingPageState>(
                builder: (onChangeContext, onChangeState) {
                  return ConcentricPageView(
                    itemCount: state.onboardingPages.itemsCount,
                    onFinish: () {
                      onFinish(context);
                    },
                    scaleFactor: AppSize.s2,
                    direction: Axis.vertical,
                    verticalPosition: AppSize.s0_87,
                    physics: const BouncingScrollPhysics(),
                    onChange: (index) {
                      context
                          .read<OnChangeOnBoardingPageCubit>()
                          .changeIndex(index);
                    },
                    colors: state.onboardingPages.pagesColors,
                    radius: responsive.screenWidth * AppSize.s0_075,
                    nextButtonBuilder: (context) => NextButton(
                      itemsCount: state.onboardingPages.itemsCount,
                      index: onChangeState.index,
                    ),
                    itemBuilder: (index) {
                      final page =
                          state.onboardingPages.getOnboardingPageData(index);

                      return PageContent(
                        content: page,
                        onFinish: onFinish,
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void onFinish(BuildContext context) {
    getIt<AppPreferences>()
        .setData<bool>(key: PrefKeys.isDoneOnboardingScreen, data: true);

    context.pushNamedAndRemoveUntil(
        predicate: (routes) => false, RoutesStrings.loginRoute);
  }
}
