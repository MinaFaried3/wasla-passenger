import 'package:wasla/app/shared/common/common_libs.dart';

class FromToStationChart extends StatelessWidget {
  const FromToStationChart(
      {super.key,
      required this.from,
      required this.to,
      this.iconsSize = 15,
      this.insiderFlex = 3,
      this.iconPath});
  final String? iconPath;
  final String from;
  final String to;
  final double iconsSize;
  final int insiderFlex;

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
          Flexible(
              flex: insiderFlex == 1 ? 2 : 1,
              child: FittedBox(child: Text(from))),

          //direction
          Expanded(
              flex: insiderFlex,
              child: DottedLineWithIconDotSection(
                size: iconsSize,
                iconPath: iconPath,
              )),

          //to
          Flexible(
              flex: insiderFlex == 1 ? 2 : 1,
              child: FittedBox(child: Text(to))),
        ],
      ),
    );
  }
}

class StationDot extends StatelessWidget {
  const StationDot({
    super.key,
    required this.width,
  });

  final double width;

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

class DottedLineWithIconDotSection extends StatelessWidget {
  const DottedLineWithIconDotSection({
    super.key,
    required this.size,
    this.iconPath,
    this.iconSize,
  });

  final double size;
  final double? iconSize;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return DottedLineWithIcon(
      size: size,
      boundaries: StationDot(
        width: size,
      ),
      iconSize: iconSize,
      iconPath: iconPath,
    );
  }
}

class DottedLineWithIcon extends StatelessWidget {
  const DottedLineWithIcon({
    super.key,
    required this.size,
    this.iconPath,
    this.iconSize,
    required this.boundaries,
  });

  final double size;
  final double? iconSize;
  final String? iconPath;
  final Widget boundaries;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          boundaries,
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              int listLength = (((constraints.constrainWidth() / 10).floor()));
              return Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(listLength, (index) {
                  if (index + 1 == (listLength / 2).round()) {
                    return AppSvg(
                      path: iconPath ?? AssetsProvider.arrowRightIcon,
                      color: ColorsManager.tealPrimary300,
                      height: iconSize ?? size,
                    );
                  }
                  return const SizedBox(
                    height: 1,
                    width: 3,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  );
                }),
              );
            }),
          ),
          boundaries,
        ],
      ),
    );
  }
}

class DottedLine extends StatelessWidget {
  const DottedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int listLength = (((constraints.constrainWidth() / 10).floor()));
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(listLength, (index) {
          return const SizedBox(
            height: 1.5,
            width: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          );
        }),
      );
    });
  }
}
