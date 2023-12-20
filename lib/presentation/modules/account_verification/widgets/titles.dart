import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class Titles extends StatefulWidget {
  const Titles({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  State<Titles> createState() => _TitlesState();
}

class _TitlesState extends State<Titles> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: DurationManager.s3);
    animation = Tween<double>(begin: 0, end: 1).animate(
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
    return FadeTransition(
      opacity: animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
            child: Text(
              widget.title.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
            child: Text(
              widget.subTitle.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
