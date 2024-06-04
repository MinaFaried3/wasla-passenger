import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';
import 'package:wasla/presentation/modules/home/main/widgets/suggestions_trips/buy_now.dart';
import 'package:wasla/presentation/modules/home/main/widgets/suggestions_trips/ticket_header.dart';
import 'package:wasla/presentation/widgets/list_tile.dart';
import 'package:wasla/presentation/widgets/section/section_decoration.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class GridTicketItem extends StatelessWidget {
  const GridTicketItem({
    super.key,
    required this.tripModel,
  });

  final SuggestionTripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: buildSectionDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //meta data
          Expanded(
            flex: 2,
            child: TicketHeader(
              tripModel: tripModel,
            ),
          ),

          //from to
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Center(
                child: FromToStationChart(
                  from: tripModel.from,
                  to: tripModel.to,
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
                tittle: tripModel.price.toString(),
                iconPath: AssetsProvider.priceIcon,
                iconSize: 20,
                fontSize: 15,
                iconColor: ColorsManager.calico,
              ),
            ),
          ),

          //book now
          const Expanded(
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
