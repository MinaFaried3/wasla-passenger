import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/divider_chart/ticket_chart_boundaries.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class TicketDividerChart extends StatelessWidget {
  const TicketDividerChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ContextManager contextManager = ContextManager(context);
    return Row(
      children: [
        TicketChartBoundaries(isLeft: contextManager.isEnglish ? true : false),
        const Expanded(
          child: DottedLine(),
        ),
        TicketChartBoundaries(isLeft: contextManager.isEnglish ? false : true),
      ],
    );
  }
}
