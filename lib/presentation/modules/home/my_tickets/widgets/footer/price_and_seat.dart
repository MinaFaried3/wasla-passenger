import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/list_tile.dart';

class PriceAndSeat extends StatelessWidget {
  const PriceAndSeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppListTile(
          tittle: '125A',
          iconPath: AssetsProvider.ticketsIcon,
          iconSize: 30.sp,
          iconColor: ColorsManager.tealPrimary200,
          fontSize: 18.sp,
          style: getBoldStyle(),
        ),
        AppListTile(
          tittle: '70,00',
          iconPath: AssetsProvider.priceIcon,
          iconSize: 30.sp,
          iconColor: ColorsManager.tealPrimary200,
          fontSize: 18.sp,
          style: getBoldStyle(),
        ),
      ],
    );
  }
}
