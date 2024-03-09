import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class ScaleImage extends StatefulWidget {
  final String path;

  const ScaleImage({super.key, required this.path});

  @override
  State<ScaleImage> createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ScaleImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: DurationManager.s3);
    scaleAnimation = Tween<double>(begin: 0.4, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 35.h),
        child: Center(
          child: SvgPicture.asset(
            widget.path,
            width: AppSize.s300.w,
          ),
        ),
      ),
    );
  }
}
