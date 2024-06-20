import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/app/shared/helper_functions.dart';
import 'package:wasla/data/responses/IncomingTripsResponse.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/divider_chart/divider_chart.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/footer/price_seat_sponsor.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/from_to/from_to_section.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/ticket_provider_image.dart';
import 'package:wasla/presentation/widgets/section/section_decoration.dart';

class TicketItem extends StatefulWidget {
  const TicketItem({
    super.key,
    required this.comingTripModel,
  });

  final IncomingTripModel comingTripModel;

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: DurationManager.m750);
    slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Container(
        width: double.infinity,
        decoration: buildSectionDecoration(),
        child: Column(
          children: [
            //ticket header
            if (widget.comingTripModel.organization != null)
              TicketProviderImage(
                  imageUrl: widget.comingTripModel.organization!.logoUrl!)
            else
              Image.asset(
                AssetsProvider.logoIcon,
                height: 40,
              ),

            //to from
            TicketFromToSection(
              startCity: widget.comingTripModel.startStation.orEmpty(),
              endCity: widget.comingTripModel.endStation.orEmpty(),
              startTime: getFormattedTimeFromString(
                  widget.comingTripModel.startTime.orEmpty()),
              endTime: getFormattedTimeFromString(
                  widget.comingTripModel.endTime.orEmpty()),
              date: getFormattedDateFromString(
                  widget.comingTripModel.startTime.orEmpty()),
            ),

            //chart
            TicketDividerChart(),

            //footer
            TicketPriceAndSeatAndSponsor(
              price: (widget.comingTripModel.price ?? 0).toInt(),
              seat: widget.comingTripModel.seatNumber,
            ),
          ],
        ),
      ),
    );
  }
}
