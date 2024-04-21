import 'package:wasla/app/shared/common/common_libs.dart';

class WaslaFeatureItem extends StatefulWidget {
  const WaslaFeatureItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onPressed,
  });

  final String iconPath;
  final String title;
  final VoidCallback onPressed;

  @override
  State<WaslaFeatureItem> createState() => _WaslaFeatureItemState();
}

class _WaslaFeatureItemState extends State<WaslaFeatureItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: DurationManager.s2);
    scaleAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: ColorsManager.darkTealBackground4,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: AppSvg(
                  path: widget.iconPath,
                  height: 50.sp,
                ),
              ),
              FittedBox(
                  child: Text(
                widget.title,
                style: getRegularStyle(fontSize: 8),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
