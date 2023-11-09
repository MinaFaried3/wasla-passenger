import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/stack_clip_path.dart';

class StartNowScreen extends StatelessWidget {
  const StartNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorManager.lightViolet,
          ColorManager.darkBlackViolet,
          ColorManager.darkViolet,
          ColorManager.darkBlackViolet,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        image: DecorationImage(
          image: AssetImage(AssetsProvider.startNowBackground),
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildStackClipPath(responsive, context),
            Padding(
              padding: EdgeInsets.only(bottom: responsive.screenHeight * 0.25),
              child: Center(
                child: Image.asset(
                  AssetsProvider.logo,
                  width: responsive.screenWidth * AppSize.s0_5,
                  height: responsive.screenHeight * AppSize.s0_5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildStackClipPath(
      ResponsiveManager responsive, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildStackClipElement(responsive, AppSize.s0_3),
        _buildStackClipElement(responsive, AppSize.s0_375),
        _buildStackClipElement(responsive, AppSize.s0_450),
        _buildStackClipElement(responsive, AppSize.s0_525,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: responsive.screenHeight * AppSize.s0_04),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RoutesStrings.onboardingRoute);
                },
                child: Text(
                  AppStrings.startNow.tr(),
                  style: getMediumStyle(
                      color: ColorManager.mauva, fontSize: AppSize.s18.sp),
                ),
              ),
            )),
      ],
    );
  }

  ClipPath _buildStackClipElement(ResponsiveManager responsive, double size,
      {Widget? child}) {
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        color: ColorManager.violet.withOpacity(AppSize.s0_2),
        height: responsive.screenHeight * size,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: child,
      ),
    );
  }
}
