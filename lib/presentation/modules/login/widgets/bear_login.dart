import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/widgets/animated_bear.dart';

class LoginBear extends StatefulWidget {
  final RiveControllerManager riveController;

  const LoginBear({super.key, required this.riveController});

  @override
  State<LoginBear> createState() => _LoginBearState();
}

class _LoginBearState extends State<LoginBear>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.textChanged);

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  void _listenToSuccessOrErrorState(BuildContext context, LoginState state) {
    final dialogCubit = context.read<BearDialogCubit>();

    state.whenOrNull(
      success: (loginModel) {
        widget.riveController.addState(BearState.success);
        dialogCubit.loginSuccessMsg();
      },
      error: (failure) {
        widget.riveController.addState(BearState.fail);
        dialogCubit.loginErrorMsg();
      },
      emptyUsername: () {
        widget.riveController.addState(BearState.fail);
        dialogCubit.usernameFieldEmptyMsg();
      },
      emptyPassword: () {
        widget.riveController.addState(BearState.fail);
        dialogCubit.passwordFieldEmptyMsg();
      },
      emptyUsernameAndPassword: () {
        widget.riveController.addState(BearState.fail);
        dialogCubit.usernameAndPasswordFieldEmptyMsg();
      },
    );
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
                  loadedSuccessfully: () =>
                      BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      _listenToSuccessOrErrorState(context, state);
                    },
                    child: AnimatedBear(
                      riveController: widget.riveController,
                    ),
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ),

          ///dialog
          Align(
            alignment: Alignment.topRight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color:
                      ColorsManager.tealPrimary1000.withOpacity(AppSize.s0_375),
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(responsive.getWidthOf(AppSize.s0_08)),
                      bottomRight:
                          Radius.circular(responsive.getWidthOf(AppSize.s0_08)),
                      topRight: Radius.circular(
                          responsive.getWidthOf(AppSize.s0_08)))),
              child: SizedBox(
                width: responsive.getWidthPercentage(50),
                height: responsive.getScreenHeightPercentage(15),
                child: Padding(
                  padding:
                      EdgeInsets.all(responsive.getWidthOf(AppSize.s0_015)),
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
                            state.tr(),
                            style: getRegularStyle(fontSize: FontSize.s20.sp),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
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
