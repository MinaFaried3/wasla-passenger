import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/discover_trip/gird_ticket_item.dart';

class DiscoverTripsContent extends StatelessWidget {
  const DiscoverTripsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.fromLR),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 19 / 20),
        itemCount: 15,
        itemBuilder: (context, index) {
          return const GridTicketItem();
        },
      ),
    );
  }
}
