import 'package:wasla/app/shared/common/common_libs.dart';

class TicketChartBoundaries extends StatelessWidget {
  const TicketChartBoundaries({
    super.key,
    required this.isLeft,
  });

  final double radius = 12;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: 15,
        height: 30,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isLeft ? 0 : radius),
              bottomLeft: Radius.circular(isLeft ? 0 : radius),
              topRight: Radius.circular(isLeft ? radius : 0),
              bottomRight: Radius.circular(isLeft ? radius : 0),
            )),
      ),
    );
  }
}
