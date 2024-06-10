import 'dart:async';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
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
                  child: Container(
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
                            padding: const EdgeInsets.only(
                                top: 15, left: 8, right: 8),
                            child: TripMetaData(
                              from: comingTrips[0].startStation.orEmpty(),
                              to: comingTrips[0].endStation.orEmpty(),
                              companyOrDriver: comingTrips[0].organization !=
                                      null
                                  ? comingTrips[0].organization!.name.orEmpty()
                                  : comingTrips[0]
                                      .publicDriver!
                                      .fullName
                                      .orEmpty(),
                              seatNumber: comingTrips[0].organization != null
                                  ? comingTrips[0]
                                      .seatNumber
                                      .orZero()
                                      .toString()
                                  : '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            orElse: () => SizedBox());
      },
    );
  }
}
