import 'package:wasla/app/shared/common/common_libs.dart';

class FromToStationChart extends StatelessWidget {
  const FromToStationChart({
    super.key,
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: getBoldStyle(fontSize: 12.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //from
          Flexible(child: FittedBox(child: Text(from))),

          //direction
          const Expanded(flex: 3, child: DottedLine()),

          //to
          Flexible(child: FittedBox(child: Text(to))),
        ],
      ),
    );
  }
}

class StationDot extends StatelessWidget {
  const StationDot({
    super.key,
  });

  final double width = 15;

  @override
  Widget build(BuildContext context) {
    double radius = (width / 2) - 2;
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: ColorsManager.offWhite,
            width: 1.5,
          )),
    );
  }
}

class DottedLine extends StatelessWidget {
  const DottedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const StationDot(),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              int listLength = (((constraints.constrainWidth() / 10).floor()));
              return Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                    ((constraints.constrainWidth() / 10).floor()), (index) {
                  if (index + 1 == (listLength / 2).round()) {
                    return const AppSvg(
                      path: AssetsProvider.arrowRightIcon,
                      color: ColorsManager.tealPrimary300,
                    );
                  }
                  return const SizedBox(
                    height: 1,
                    width: 5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  );
                }),
              );
            }),
          ),
          const StationDot(),
        ],
      ),
    );
  }
}
