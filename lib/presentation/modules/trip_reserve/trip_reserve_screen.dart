import 'package:flutter/cupertino.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/requests/OrgTripReserveResponse.dart';
import 'package:wasla/data/responses/TripsSearchResponse.dart';
import 'package:wasla/generated/app_image.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/from_to/from_to_section.dart';
import 'package:wasla/presentation/modules/trip_reserve/cubit/org_trip_reserve_cubit.dart';
import 'package:wasla/presentation/modules/trip_reserve/cubit/trip_seats_cubit.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';
import 'package:wasla/presentation/widgets/section/section_decoration.dart';
import 'package:wasla/presentation/widgets/section/section_title.dart';

import '../../widgets/retry.dart';

class TripReserveScreen extends StatefulWidget {
  const TripReserveScreen({super.key, required this.orgTripModel});

  final OrgTripModel orgTripModel;

  @override
  State<TripReserveScreen> createState() => _TripReserveScreenState();
}

class _TripReserveScreenState extends State<TripReserveScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PasswordIconCubit>().forceClose();
    context.read<TripSeatsCubit>().getTripSeats(
          widget.orgTripModel.tripId!.toString(),
        );
  }

  final TextEditingController addressController = TextEditingController();
  bool onRoad = false;
  final List<int> reversedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ججز الرحلة'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TicketFromToSection(
                startCity: widget.orgTripModel.startStation!,
                endCity: widget.orgTripModel.endStation!,
                date: widget.orgTripModel.tripDate!,
                startTime: widget.orgTripModel.tripStartTime!,
                endTime: widget.orgTripModel.tripEndTime.orEmpty(),
              ),
              VerticalSpace(20),
              SizedBox(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: BlocBuilder<TripSeatsCubit, TripSeatsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          loading: () => LoadingIndicator(),
                          getTripSeatsFailure: (message) => Retry(
                                onPressed: () => context
                                    .read<TripSeatsCubit>()
                                    .getTripSeats(
                                      widget.orgTripModel.tripId!.toString(),
                                    ),
                                text: message,
                              ),
                          getTripSeatsSuccess: (seats) {
                            int length = seats.length;
                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: length <= 15 ? 3 : 4,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                final seat = seats[index];
                                if (seat.setNum == -1)
                                  return buildDriverSeat();
                                else if (seat.isAvailable!)
                                  return buildSelectableSeat(index);
                                else
                                  return buildUnAvailableSeat(index);
                              },
                              itemCount: length,
                            );
                          },
                          orElse: () => SizedBox());
                    },
                  ),
                ),
              ),
              VerticalSpace(10),
              SectionTitle(
                title: 'الكراسي المحجوزة',
                iconPath: AssetsProvider.seatsPositionIcon,
              ),
              SizedBox(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: reversedSeats
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildSelectedItem(e),
                          ))
                      .toList(),
                ),
              ),
              VerticalSpace(10),
              BlocBuilder<PasswordIconCubit, PasswordIconState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'الركوب علي الطريق',
                            style: getRegularStyle(fontSize: 20),
                          ),
                          Spacer(),
                          state.when(
                            closedIcon: (val, active) => CupertinoSwitch(
                              value: active,
                              activeColor: ColorsManager.tealPrimary800,
                              onLabelColor: ColorsManager.twine,
                              thumbColor: active
                                  ? ColorsManager.offWhite300
                                  : ColorsManager.tealPrimary800,
                              trackColor: ColorsManager.tealPrimary1000,
                              onChanged: (val) {
                                onRoad = val;
                                context
                                    .read<PasswordIconCubit>()
                                    .toggleOpenCloseIcon();
                              },
                            ),
                            shownIcon: (val, active) => CupertinoSwitch(
                              value: active,
                              activeColor: ColorsManager.tealPrimary800,
                              onLabelColor: ColorsManager.twine,
                              thumbColor: active
                                  ? ColorsManager.offWhite300
                                  : ColorsManager.tealPrimary800,
                              trackColor: ColorsManager.tealPrimary1000,
                              onChanged: (val) {
                                onRoad = val;
                                context
                                    .read<PasswordIconCubit>()
                                    .toggleOpenCloseIcon();
                              },
                            ),
                          ),
                        ],
                      ),
                      VerticalSpace(20),
                      if (onRoad)
                        AppTextFormField(
                          controller: addressController,
                          svgPrefixPath: AssetsProvider.locationIcon,
                          labelText: 'العنوان',
                        ),
                      VerticalSpace(20),
                    ],
                  );
                },
              ),
              VerticalSpace(10),
              BlocConsumer<OrgTripReserveCubit, OrgTripReserveState>(
                listener: (context, state) {
                  state.whenOrNull(
                    requestOrgTripFailure: (message) => showAppToast(message),
                    requestOrgTripSuccess: (message) => showAppToast(message),
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                      loading: () => LoadingButton.loading(),
                      orElse: () => LoadingButton(
                            text: 'حجز الرحلة',
                            onPressed: () async {
                              final passenger = (await getIt<LocalDataSource>()
                                  .getPassengerModel());
                              context
                                  .read<OrgTripReserveCubit>()
                                  .requestOrgTrip(OrgTripReserveRequest(
                                      onRoad: onRoad,
                                      locationDescription:
                                          addressController.text,
                                      tripId: widget.orgTripModel.tripId!,
                                      seats: reversedSeats
                                          .map((e) => Seats(
                                              seatNum: e,
                                              qrCodeFile: null,
                                              name: passenger.userName))
                                          .toList()));
                              addressController.text = '';
                            },
                          ));
                },
              ),
              VerticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDriverSeat() {
    return Container(
      decoration:
          buildSectionDecoration(color: ColorsManager.twine, radius: 20),
      child: Center(
          child: AppSvg(
        path: Assets.svgDriverIcon,
      )),
    );
  }

  Container buildUnAvailableSeat(int index) {
    return Container(
      decoration:
          buildSectionDecoration(color: ColorsManager.red900, radius: 20),
      child: Center(
          child: Text(
        index.toString(),
        style: getMediumStyle(fontSize: 20, color: ColorsManager.offWhite),
      )),
    );
  }

  Container buildSelectedItem(int index) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: buildSectionDecoration(
          color: ColorsManager.tealPrimary500, radius: 20),
      child: Center(
          child: Text(
        index.toString(),
        style: getMediumStyle(fontSize: 20, color: ColorsManager.darkTeal),
      )),
    );
  }

  Widget buildUnSelectedSeat(int index) {
    return Container(
      decoration: buildSectionDecoration(color: Colors.grey, radius: 20),
      child: Center(
          child: Text(
        index.toString(),
        style: getMediumStyle(fontSize: 20, color: ColorsManager.tealPrimary),
      )),
    );
  }

  Widget buildSelectableSeat(int index) {
    return GestureDetector(
      onTap: () {
        if (reversedSeats.contains(index))
          reversedSeats.remove(index);
        else
          reversedSeats.add(index);
        setState(() {});
      },
      child: reversedSeats.contains(index)
          ? buildSelectedItem(index)
          : buildUnSelectedSeat(index),
    );
  }
}
