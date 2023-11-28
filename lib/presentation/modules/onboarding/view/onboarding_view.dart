import 'package:concentric_transition/concentric_transition.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/next_button.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/page_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
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
                    _onFinish(context);
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
    );
  }

  void _onFinish(BuildContext context) {
    context.pushReplacementNamed(RoutesStrings.loginRoute);
  }
}
