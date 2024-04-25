import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/progress_painter.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double currIndex;

  const CustomProgressIndicator({
    super.key,
    required this.currIndex,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ContextManager(context, hasAppBar: false);
    return CustomPaint(
      size: Size(responsive.screenWidth * AppSize.s1_5,
          responsive.screenWidth * AppSize.s1_5),
      painter: ProgressPainter(
        progress: currIndex * 100,
        barColor: ColorsManager.offWhite,
        topColor: ColorsManager.offWhite500.withOpacity(AppSize.s0_75),
      ),
    );
  }
}
