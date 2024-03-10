import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/modules/start_now/widgets/bottom_stack_element.dart';

class StartNowScreen extends StatefulWidget {
  const StartNowScreen({super.key});

  @override
  State<StartNowScreen> createState() => _StartNowScreenState();
}

class _StartNowScreenState extends State<StartNowScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.s3);

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    ));

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

    return PopScope(
      onPopInvoked: (pop) {
        // SystemNavigator.pop();
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradientManager.startNowGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: GradientManager.startNowStops,
          ),
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
              const BottomStackElements(),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: responsive.screenHeight * AppSize.s0_2,
                  ),
                  child: Center(
                    child: Image.asset(
                      AssetsProvider.logo,
                      width: responsive.screenWidth * AppSize.s0_5,
                      height: responsive.screenHeight * AppSize.s0_5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
