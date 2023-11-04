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
                  scaleFactor: 2,
                  direction: Axis.vertical,
                  verticalPosition: 0.9,
                  physics: BouncingScrollPhysics(),
                  onChange: (index) {},
                  colors: state.onboardingPages.pagesColors,
                  radius: resp.screenWidth * 0.075,
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
                      "تخطي",
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
      padding: const EdgeInsets.only(left: 1),
      child: Icon(
        IconsManager.down,
        size: resp.screenWidth * 0.1,
      ),
    );
  }

  void _onFinish(context) {
    Navigator.of(context).pushReplacementNamed(RoutesStrings.loginRoute);
  }

  _page(context, {required OnboardingModel page}) {
    final resp = ResponsiveManager(context);
    space(double p) => SizedBox(
          height: resp.getBodyHeightPercentage(p),
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
                maxWidth: resp.screenWidth * 0.9,
                maxHeight: resp.bodyHeight * 0.75),
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
