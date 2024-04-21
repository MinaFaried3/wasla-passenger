import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/points_chart.dart';

class FreeTripChart extends StatelessWidget {
  const FreeTripChart({
    super.key,
    required this.points,
  });

  final int points;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: getLightStyle(
        fontSize: 14.sp,
        color: ColorsManager.tealPrimary700,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
            width: 150.w,
            child: PointsCharts(
              points: points,
            ),
          ),
          FittedBox(
              child: Text(
            AppStrings.totalPoints.tr(),
          )),
          FittedBox(
              child: Text(
            AppStrings.forFreeTrip.tr(),
          )),
        ],
      ),
    );
  }
}
