import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/discover_trip/buy_now.dart';
import 'package:wasla/presentation/modules/home/main/widgets/discover_trip/ticket_header.dart';
import 'package:wasla/presentation/widgets/list_tile.dart';
import 'package:wasla/presentation/widgets/section/section_decoration.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class GridTicketItem extends StatelessWidget {
  const GridTicketItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: buildSectionDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //meta data
          Expanded(
            flex: 2,
            child: TicketHeader(),
          ),

          //from to
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Center(
                child: FromToStationChart(
                  from: 'from',
                  to: 'to',
                  iconsSize: 10,
                ),
              ),
            ),
          ),

          // price
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: AppListTile(
                tittle: '70,00',
                iconPath: AssetsProvider.priceIcon,
                iconSize: 20,
                fontSize: 15,
                iconColor: ColorsManager.calico,
              ),
            ),
          ),

          //book now
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: BuyNow(),
            ),
          )
        ],
      ),
    );
  }
}
