import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/section/section_with_tittle.dart';

class PassengersCountSection extends StatefulWidget {
  const PassengersCountSection({
    super.key,
  });

  @override
  State<PassengersCountSection> createState() => _PassengersCountSectionState();
}

class _PassengersCountSectionState extends State<PassengersCountSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m250);
    _animation = Tween<Offset>(begin: const Offset(0.0, -0.5), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
        tittle: AppStrings.passengersCount.tr(),
        iconPath: AssetsProvider.ticketsIcon,
        content: Row(
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  if (count < 14) {
                    count++;
                    animate();
                  }
                });
              },
              child: const Icon(Icons.add),
            ),
            buildHorizontalSpace(),
            Expanded(
                child: DecoratedBox(
              decoration: BoxDecoration(
                color: ColorsManager.tealPrimary1000,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                        position: _animation,
                        child: Text(
                          '$count ',
                          style: getBoldStyle(color: ColorsManager.calico),
                        )),
                    Text(AppStrings.ticket.tr())
                  ],
                ),
              ),
            )),
            buildHorizontalSpace(),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  if (count > 1) {
                    count--;
                    animate();
                  }
                });
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }

  HorizontalSpace buildHorizontalSpace() => const HorizontalSpace(10);

  void animate() {
    _animationController.reset();
    _animationController.forward();
  }
}
