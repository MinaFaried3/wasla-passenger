import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip/provider_seat_num.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class TripMetaData extends StatelessWidget {
  const TripMetaData({
    super.key,
    required this.from,
    required this.to,
    required this.companyOrDriver,
    required this.seatNumber,
  });

  final String from;
  final String to;
  final String companyOrDriver;
  final String seatNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: FromToStationChart(from: from, to: to),
        ),

        // company or driver
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
          child: TripProviderAndSeatNumber(
            companyOrDriver: companyOrDriver,
            seatNumber: seatNumber,
          ),
        ),
      ],
    );
  }
}
