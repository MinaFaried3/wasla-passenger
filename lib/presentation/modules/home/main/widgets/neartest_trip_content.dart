import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/trip_meta_data.dart';
import 'package:wasla/presentation/modules/home/main/widgets/trip_timer.dart';
import 'package:wasla/presentation/widgets/section_decoration.dart';

class NearestTripContent extends StatelessWidget {
  const NearestTripContent({
    super.key,
  });

  final String time = '05:30';
  final String from = 'سوهاج';
  final String to = 'طما';
  final String companyOrDriver = 'حورس للنقل الجماعي';
  final String seatNumber = '108A';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      height: 145.h,
      decoration: buildSectionDecoration(),
      child: Row(
        children: [
          //timer
          NearestTripTimer(time: time),

          //meta data
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
              child: TripMetaData(
                from: from,
                to: to,
                companyOrDriver: companyOrDriver,
                seatNumber: seatNumber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
