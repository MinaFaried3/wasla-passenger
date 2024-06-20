import 'dart:async';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/IncomingTripsResponse.dart';
import 'package:wasla/presentation/modules/home/home/cubit/home_cubit.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip/trip_meta_data.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip/trip_timer.dart';
import 'package:wasla/presentation/modules/home/my_tickets/cubit/coming_trip_cubit.dart';
import 'package:wasla/presentation/widgets/retry.dart';
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
  Duration remainingTime = Duration();
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: DurationManager.s4);
    slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutBack,
    ));
    context.read<ComingTripCubit>().getComingTrips();
    startTimer();
    animationController.forward();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (context.read<ComingTripCubit>().incomingTripDateTime == null) return;
      setState(() {
        remainingTime = context
            .read<ComingTripCubit>()
            .incomingTripDateTime!
            .difference(DateTime.now());
        if (remainingTime.isNegative) {
          countdownTimer?.cancel();
        }
      });
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComingTripCubit, ComingTripState>(
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => LoadingIndicator(),
            getComingTripsFailure: (message) => Retry(
                  onPressed: () =>
                      context.read<ComingTripCubit>().getComingTrips(),
                  text: message,
                ),
            getComingTripsSuccess: (comingTrips) => SlideTransition(
                  position: slideAnimation,
                  child: buildNearestTrip(comingTrips[0]),
                ),
            emptyTickets: () => SlideTransition(
                  position: slideAnimation,
                  child: buildNoComingTrip(),
                ),
            orElse: () => SizedBox());
      },
    );
  }

  Container buildNoComingTrip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      height: 145.h,
      decoration: buildSectionDecoration(),
      child: Row(
        children: [
          //timer
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorsManager.offWhite,
                  borderRadius: BorderRadius.circular(35)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      'احجز رحلتك الان',
                      style: getSemiBoldStyle(
                        color: ColorsManager.tealPrimary1000,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  VerticalSpace(10),
                  Flexible(
                    child: FittedBox(
                      child: MaterialButton(
                        onPressed: () {
                          context.read<HomeCubit>().changeBodyContent(2);
                        },
                        child: AppSvg(
                          path: AssetsProvider.searchIcon,
                          height: 60,
                          color: ColorsManager.tealPrimary1000,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          //meta data
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
              child: LoadingIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Container buildNearestTrip(IncomingTripModel comingTrip) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      height: 145.h,
      decoration: buildSectionDecoration(),
      child: Row(
        children: [
          //timer
          NearestTripTimer(
              time: remainingTime.isNegative
                  ? "Time's up!"
                  : formatDuration(remainingTime)),

          //meta data
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
              child: TripMetaData(
                from: comingTrip.startStation.orEmpty(),
                to: comingTrip.endStation.orEmpty(),
                companyOrDriver: comingTrip.organization != null
                    ? comingTrip.organization!.name.orEmpty()
                    : comingTrip.publicDriver!.fullName.orEmpty(),
                seatNumber: comingTrip.organization != null
                    ? comingTrip.seatNumber.orZero().toString()
                    : '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
