import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/footer/price_and_seat.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/footer/sponsor.dart';

class TicketPriceAndSeatAndSponsor extends StatelessWidget {
  const TicketPriceAndSeatAndSponsor({
    super.key,
    this.price,
    this.seat,
  });

  final int? price, seat;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
          child: PriceAndSeat(
            price: price,
            seat: seat,
          ),
        ),
        Sponsor(),
      ],
    );
  }
}
