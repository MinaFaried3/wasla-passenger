import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/login/widgets/bear_login.dart';
import 'package:wasla/presentation/modules/login/widgets/login_form.dart';
import 'package:wasla/presentation/modules/login/widgets/login_providers.dart';
import 'package:wasla/presentation/modules/login/widgets/or.dart';
import 'package:wasla/presentation/modules/login/widgets/register_now.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final AnimationController _formAnimationController;
  late final AnimationController _bearAnimationController;
  late final Animation<Offset> _formOffsetAnimation;
  late final Animation<Offset> _bearOffsetAnimation;
  late final Animation<double> _bearFadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;
  late final RiveControllerManager riveController;

  @override
  void initState() {
    super.initState();
    riveController = context.read<BearAnimationCubit>().riveController;
    _initAnimation();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    riveController.addState(BearState.lookIdle);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.getWidthPercentage(AppSize.s3)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///bear animation
                  FadeTransition(
                    opacity: _bearFadeAnimation,
                    child: SlideTransition(
                        position: _bearOffsetAnimation,
                        child: LoginBear(riveController: riveController)),
                  ),

                  ///login form
                  SlideTransition(
                    position: _formOffsetAnimation,
                    child: LoginForm(
                      riveController: riveController,
                    ),
                  ),

                  ///or
                  FadeTransition(opacity: _fadeAnimation, child: const Or()),

                  ///login providers
                  ScaleTransition(
                      scale: _scaleAnimation, child: const LoginProviders()),

                  ///register button
                  FadeTransition(
                      opacity: _fadeAnimation, child: const RegisterNow())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _initAnimation() {
    _formAnimationController =
        AnimationController(vsync: this, duration: DurationManager.m3500);
    _bearAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s2);

    _formOffsetAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _formAnimationController,
      curve: Curves.easeInOutQuint,
    ));
    _bearOffsetAnimation =
        Tween<Offset>(begin: const Offset(0, 1.3), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _bearAnimationController,
      curve: Curves.easeInOutBack,
    ));

    _scaleAnimation = CurvedAnimation(
        parent: _bearAnimationController, curve: Curves.bounceInOut);
    _fadeAnimation = CurvedAnimation(
        parent: _formAnimationController, curve: Curves.easeInBack);
    _bearFadeAnimation = Tween<double>(begin: AppSize.s0_375, end: AppSize.s1)
        .animate(CurvedAnimation(
            parent: _bearAnimationController, curve: Curves.easeInOutBack));

    _startAnimation();
  }

  void _startAnimation() {
    _formAnimationController.forward();

    _formAnimationController.addListener(() {
      if (_formAnimationController.status == AnimationStatus.completed) {
        _bearAnimationController.forward();
      }
    });
  }

  void _dispose() {
    _formAnimationController.dispose();
    _bearAnimationController.dispose();
  }
}
