import 'package:concentric_transition/concentric_transition.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resp = ResponsiveManager(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingInitial)
          return Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ConcentricPageView(
                  itemCount: state.onboardingPages.itemsCount,
                  onFinish: () {
                    _onFinish(context);
                  },
                  scaleFactor: AppSize.s2,
                  direction: Axis.vertical,
                  verticalPosition: AppSize.s0_9,
                  physics: BouncingScrollPhysics(),
                  onChange: (index) {},
                  colors: state.onboardingPages.pagesColors,
                  radius: resp.screenWidth * AppSize.s0_075,
                  nextButtonBuilder: (context) => _buildNextButton(resp),
                  itemBuilder: (index) {
                    final page =
                        state.onboardingPages.getOnboardingPageData(index);
                    return _page(context, page: page);
                  },
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.skip,
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          );
        else
          return SizedBox();
      },
    );
  }

  Widget _buildNextButton(ResponsiveManager resp) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p1),
      child: Icon(
        IconsManager.down,
        size: resp.screenWidth * AppSize.s0_1,
      ),
    );
  }

  void _onFinish(context) {
    Navigator.of(context).pushReplacementNamed(RoutesStrings.loginRoute);
  }

  _page(context, {required OnboardingModel page}) {
    final responsive = ResponsiveManager(context);
    space(double p) => SizedBox(
          height: responsive.getBodyHeightPercentage(p),
        );
    return SafeArea(
      child: Column(
        children: [
          Text(
            page.title,
            style: getBoldStyle(fontSize: 15.sp, color: page.textColor),
          ),
          space(1),
          Text(
            page.subTitle,
            style: getMediumStyle(color: page.textColor),
            textAlign: TextAlign.center,
          ),
          space(2),
          Container(
            constraints: BoxConstraints(
                maxWidth: responsive.screenWidth * 0.9,
                maxHeight: responsive.bodyHeight * AppSize.s0_75),
            child: Center(
              child: Image.asset(
                page.image,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
