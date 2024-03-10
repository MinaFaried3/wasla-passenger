import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/modules/start_now/widgets/bottom_curved_widget.dart';

class BottomStackElements extends StatefulWidget {
  const BottomStackElements({
    super.key,
  });

  @override
  State<BottomStackElements> createState() => _BottomStackElementsState();
}

class _BottomStackElementsState extends State<BottomStackElements>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.s3);

    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCirc,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizeTransition(
            sizeFactor: _sizeAnimation,
            child:
                BottomCurvedWidget(responsive: responsive, size: AppSize.s0_3)),
        SizeTransition(
            sizeFactor: _sizeAnimation,
            child: BottomCurvedWidget(
                responsive: responsive, size: AppSize.s0_375)),
        SizeTransition(
            sizeFactor: _sizeAnimation,
            child: BottomCurvedWidget(
                responsive: responsive, size: AppSize.s0_450)),
        SizeTransition(
          sizeFactor: _sizeAnimation,
          child: BottomCurvedWidget(
              responsive: responsive,
              size: AppSize.s0_525,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: responsive.screenHeight * AppSize.s0_04),
                child: TextButton(
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                        foregroundColor: const MaterialStatePropertyAll(
                          ColorsManager.tealPrimary,
                        ),
                      ),
                  onPressed: () {
                    startNowOnPressed(context);
                  },
                  child: Text(
                    AppStrings.startNow.tr(),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  void startNowOnPressed(BuildContext context) {
    getIt<AppPreferences>()
        .setData<bool>(key: PrefKeys.isDoneStartNowScreen, data: true);

    context.pushNamedAndRemoveUntil(
        predicate: (routes) => false, RoutesStrings.onboardingRoute);
  }
}
