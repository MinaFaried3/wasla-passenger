import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/divider_chart/ticket_chart_boundaries.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class TicketDividerChart extends StatelessWidget {
  const TicketDividerChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TicketChartBoundaries(isLeft: false),
        Expanded(
          child: DottedLine(),
        ),
        TicketChartBoundaries(isLeft: true),
      ],
    );
  }
}
