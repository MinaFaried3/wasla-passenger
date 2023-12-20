import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class SlideBottomWidgets extends StatefulWidget {
  const SlideBottomWidgets({
    super.key,
    required this.firstChild,
    required this.secondChild,
  });

  final Widget firstChild;
  final Widget secondChild;

  @override
  State<SlideBottomWidgets> createState() => _SlideBottomWidgetsState();
}

class _SlideBottomWidgetsState extends State<SlideBottomWidgets>
    with TickerProviderStateMixin {
  late final AnimationController firstAnimationController;
  late final AnimationController secondAnimationController;

  late Animation<Offset> firstAnimation;
  late Animation<Offset> secondAnimation;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    firstAnimationController = AnimationController(
        vsync: this,
        duration: DurationManager.s2,
        lowerBound: 0,
        upperBound: 1);
    secondAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s3);

    firstAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: firstAnimationController, curve: Curves.ease));
    secondAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: secondAnimationController, curve: Curves.ease));

    // firstAnimationController.addListener(_firstAnimationListener);
    firstAnimationController.forward();
    secondAnimationController.forward();
  }

  _firstAnimationListener() {
    if (firstAnimationController.value == 3.0) {
      PrintManager.print(firstAnimationController.value);
      secondAnimationController.forward();
    }
  }

  @override
  void dispose() {
    // firstAnimationController.removeListener(_firstAnimationListener);
    firstAnimationController.dispose();
    secondAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: firstAnimation,
          child: widget.firstChild,
        ),
        VerticalSpace(AppSize.s20.h),
        SlideTransition(
          position: secondAnimation,
          child: widget.secondChild,
        )
      ],
    );
  }
}
