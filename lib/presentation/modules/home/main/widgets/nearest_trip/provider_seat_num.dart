import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/list_tile.dart';

class TripProviderAndSeatNumber extends StatelessWidget {
  const TripProviderAndSeatNumber({
    super.key,
    required this.companyOrDriver,
    required this.seatNumber,
  });

  final String companyOrDriver;
  final String seatNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppListTile(
          tittle: companyOrDriver,
          iconPath: AssetsProvider.busIcon,
          fontSize: 20,
        ),
        AppListTile(
          tittle: seatNumber,
          iconPath: AssetsProvider.ticketsIcon,
          fontSize: 20,
        ),
      ],
    );
  }
}
