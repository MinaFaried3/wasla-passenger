import 'package:fl_chart/fl_chart.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

class PointsCharts extends StatelessWidget {
  const PointsCharts({
    super.key,
    required this.points,
  });

  final int points;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: DurationManager.s4,
      curve: Curves.easeInOut,
      tween: IntTween(begin: 0, end: points),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: value.toDouble(),
                    color: ColorsManager.tealPrimary600,
                    gradient: const LinearGradient(colors: [
                      ColorsManager.tealPrimary600,
                      ColorsManager.tealPrimary1000,
                    ]),
                    showTitle: false,
                    radius: 6.r,
                  ),
                  PieChartSectionData(
                    value: 100 - value.toDouble(),
                    gradient: LinearGradient(colors: [
                      ColorsManager.offWhite1000.withOpacity(0.3),
                      ColorsManager.offWhite200.withOpacity(0.6),
                    ]),
                    showTitle: false,
                    radius: 6.r,
                  ),
                ],
              ),
            ),
            Text(
              '$value%',
              style: getExtraBoldStyle(
                color: ColorsManager.tealPrimary400,
              ),
            )
          ],
        );
      },
    );
  }
}
