import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/widgets/animated_bear.dart';

class AuthBear extends StatefulWidget {
  final RiveControllerManager riveController;

  const AuthBear({super.key, required this.riveController});

  @override
  State<AuthBear> createState() => _AuthBearState();
}

class _AuthBearState extends State<AuthBear>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m750);

    _animation = Tween<double>(
      begin: AppConstants.doubleZero,
      end: AppConstants.doubleOne,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    return SizedBox(
      width: double.infinity,
      height: responsive.getScreenHeightOf(AppSize.s0_275),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ///bear
          Align(
            alignment: Alignment.bottomLeft,
            child: BlocBuilder<BearAnimationCubit, BearAnimationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const LoadingIndicator(),
                  loadedSuccessfully: () => AnimatedBear(
                    riveController: widget.riveController,
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ),

          ///dialog
          Align(
            alignment: Alignment.topRight,
            child: ScaleTransition(
              scale: _animation,
              alignment: Alignment.bottomLeft,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Container(
                  width: responsive.getWidthPercentage(50),
                  decoration: BoxDecoration(
                      color: ColorsManager.tealPrimary1000
                          .withOpacity(AppSize.s0_375),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              responsive.getWidthOf(AppSize.s0_08)),
                          bottomRight: Radius.circular(
                              responsive.getWidthOf(AppSize.s0_08)),
                          topRight: Radius.circular(
                              responsive.getWidthOf(AppSize.s0_08)))),
                  child: Padding(
                    padding:
                        EdgeInsets.all(responsive.getWidthOf(AppSize.s0_02)),
                    child: Center(
                      child: BlocConsumer<BearDialogCubit, String>(
                        listener: (context, state) {
                          _animationController.reset();
                          _animationController.forward();
                        },
                        builder: (context, state) {
                          return FadeTransition(
                            opacity: _animation,
                            child: Text(
                              state,
                              style: getRegularStyle(fontSize: FontSize.s18.sp),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
