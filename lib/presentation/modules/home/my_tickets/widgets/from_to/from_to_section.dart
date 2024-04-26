import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/from_to/trip_point.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class TicketFromToSection extends StatelessWidget {
  const TicketFromToSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Row(
        children: [
          TripPoint(
              tittle: AppStrings.tripStart.tr(),
              time: '10:00am',
              city: 'سوهاج'),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DottedLineWithIconDotSection(
                size: 15.sp,
                iconPath: AssetsProvider.busIcon,
                iconSize: 30.sp,
              ),
              Text(
                'Nov 12',
                style: getBoldStyle(fontSize: 8),
              )
            ],
          )),
          TripPoint(
              tittle: AppStrings.tripEnd.tr(), time: '11:00am', city: 'طما'),
        ],
      ),
    );
  }
}
