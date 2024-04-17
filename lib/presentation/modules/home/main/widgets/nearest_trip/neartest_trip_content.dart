import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip/trip_meta_data.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip/trip_timer.dart';
import 'package:wasla/presentation/widgets/section/section_decoration.dart';

class NearestTripContent extends StatefulWidget {
  const NearestTripContent({
    super.key,
  });

  @override
  State<NearestTripContent> createState() => _NearestTripContentState();
}

class _NearestTripContentState extends State<NearestTripContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> slideAnimation;

  final String time = '05:30';

  final String from = 'سوهاج';

  final String to = 'طما';

  final String companyOrDriver = 'حورس للنقل الجماعي';

  final String seatNumber = '108A';

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: DurationManager.s6);
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
        padding: const EdgeInsets.all(10),
        height: 145.h,
        decoration: buildSectionDecoration(),
        child: Row(
          children: [
            //timer
            NearestTripTimer(time: time),

            //meta data
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                child: TripMetaData(
                  from: from,
                  to: to,
                  companyOrDriver: companyOrDriver,
                  seatNumber: seatNumber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
