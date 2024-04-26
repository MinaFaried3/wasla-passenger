import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class FromToChart extends StatefulWidget {
  const FromToChart({
    super.key,
  });

  @override
  State<FromToChart> createState() => _FromToChartState();
}

class _FromToChartState extends State<FromToChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: DurationManager.s3);
    _animation = Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.bounceOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth / 6.5, vertical: 2.5),
          child: const DottedLineWithIcon(
            boundaries: AppSvg(
              path: AssetsProvider.locationIcon,
              height: 30,
            ),
            size: 20,
            iconPath: AssetsProvider.busIcon,
            iconSize: 45,
          ),
        );
      }),
    );
  }
}
