import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/widgets/auth/components/auth_bear.dart';
import 'package:wasla/presentation/widgets/auth/components/auth_providers.dart';
import 'package:wasla/presentation/widgets/auth/components/or.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(
      {super.key,
      required this.form,
      required this.bottomAction,
      required this.riveController,
      this.bearHeight});

  final Widget form;
  final Widget bottomAction;
  final double? bearHeight;
  final RiveControllerManager riveController;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> with TickerProviderStateMixin {
  late final AnimationController _formAnimationController;
  late final AnimationController _bearAnimationController;
  late final Animation<Offset> _formOffsetAnimation;
  late final Animation<Offset> _bearOffsetAnimation;
  late final Animation<double> _bearFadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
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
    widget.riveController.addState(BearState.lookIdle);
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
                        child: SizedBox(
                            height: widget.bearHeight,
                            child: AuthBear(
                                riveController: widget.riveController))),
                  ),

                  ///auth form
                  SlideTransition(
                    position: _formOffsetAnimation,
                    child: widget.form,
                  ),

                  ///or
                  FadeTransition(opacity: _fadeAnimation, child: const Or()),

                  ///login providers
                  ScaleTransition(
                      scale: _scaleAnimation, child: const AuthProviders()),

                  ///register button
                  FadeTransition(
                      opacity: _fadeAnimation, child: widget.bottomAction)
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
    _bearFadeAnimation = Tween<double>(begin: AppSize.s0, end: AppSize.s1)
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
