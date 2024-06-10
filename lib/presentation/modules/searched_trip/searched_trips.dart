import 'package:flutter/cupertino.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/requests/publicTripReserveRequest.dart';
import 'package:wasla/data/responses/TripsSearchResponse.dart';
import 'package:wasla/generated/app_image.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/footer/sponsor.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/profile_tile.dart';
import 'package:wasla/presentation/modules/home/search_trip/trip_search_cubit.dart';
import 'package:wasla/presentation/modules/searched_trip/cubit/public_trip_reserve_cubit.dart';
import 'package:wasla/presentation/modules/trip_reserve/trip_reserve_screen.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';
import 'package:wasla/presentation/widgets/dialog.dart';
import 'package:wasla/presentation/widgets/retry.dart';
import 'package:wasla/presentation/widgets/section/section_decoration.dart';
import 'package:wasla/presentation/widgets/section/section_title.dart';
import 'package:wasla/presentation/widgets/to_from_chart.dart';

class SearchedTripsScreen extends StatefulWidget {
  const SearchedTripsScreen({super.key});

  @override
  State<SearchedTripsScreen> createState() => _SearchedTripsScreenState();
}

class _SearchedTripsScreenState extends State<SearchedTripsScreen> {
  final TextEditingController addressController = TextEditingController();
  bool onRoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نتائج البحث'),
      ),
      body: BlocBuilder<TripSearchCubit, TripSearchState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => LoadingIndicator(),
              searchTripFailure: (message) => Retry(
                  onPressed: () {
                    context.read<TripSearchCubit>().searchForTrip();
                  },
                  text: message),
              searchTripSuccess: (searchResult) {
                final List<PublicTripModel> publicTrips =
                    searchResult.publicTrips!;
                final List<OrgTripModel> orgTrips = searchResult.orgTrips!;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if (publicTrips.isNotEmpty)
                        Column(
                          children: [
                            SectionTitle(
                              title: 'الرحلات العامة',
                              iconPath: Assets.svgDriverIcon,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      buildPublicTripItem(publicTrips[index]),
                                  itemCount: publicTrips.length),
                            ),
                          ],
                        ),
                      SectionTitle(
                        title: 'رحلات الشركة',
                        iconPath: Assets.svgStationIcon,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildOrgItem(orgTrips, index),
                          separatorBuilder: (context, index) =>
                              VerticalSpace(10),
                          itemCount: orgTrips.length),
                    ],
                  ),
                );
              },
              orElse: () => SizedBox());
        },
      ),
    );
  }

  Widget buildOrgItem(List<OrgTripModel> orgTrips, int index) {
    return GestureDetector(
      onTap: () {
        context.push(TripReserveScreen(orgTripModel: orgTrips[index]));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: buildSectionDecoration(),
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      orgTrips[index].imgUrl!,
                      width: 120,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FromToStationChart(
                  from: orgTrips[index].startStation!,
                  to: orgTrips[index].endStation!,
                  insiderFlex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          AppSvg(
                            path: Assets.svgStationIcon,
                            height: 30,
                            color: ColorsManager.tealPrimary400,
                          ),
                          HorizontalSpace(10),
                          Text(orgTrips[index].orgName!,
                              style: getBoldStyle(fontSize: 25))
                        ],
                      )),
                      Image.asset(
                        Assets.logoLogoIcon,
                        height: 50,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppSvg(
                            path: Assets.svgPriceIcon,
                            height: 30,
                            color: ColorsManager.calico,
                          ),
                          HorizontalSpace(10),
                          Text(orgTrips[index].price!.toString(),
                              style: getBoldStyle(fontSize: 25))
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration:
                      buildSectionDecoration(color: ColorsManager.darkTeal),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ProfileTile(
                                iconPath: AssetsProvider.clockIcon,
                                tittle: orgTrips[index].tripStartTime!),
                          ),
                          Expanded(
                            child: ProfileTile(
                                iconPath: AssetsProvider.calendarIcon,
                                tittle: orgTrips[index].tripDay!),
                          ),
                          Expanded(
                            child: ProfileTile(
                                iconPath: AssetsProvider.calendarIcon,
                                tittle: orgTrips[index].tripDate!),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalSpace(5),
                Sponsor()
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              decoration: BoxDecoration(
                  color: ColorsManager.red900,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(25),
                  )),
              child: Text(
                orgTrips[index].points!.toString(),
                style: getLightStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPublicTripItem(PublicTripModel publicTrip) {
    return GestureDetector(
      onTap: () {
        context.read<PasswordIconCubit>().forceClose();
        onRoad = false;
        showDialog(
            context: context,
            builder: (context) {
              return AppDialog(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
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
                                      closedIcon: (val, active) =>
                                          CupertinoSwitch(
                                        value: active,
                                        activeColor:
                                            ColorsManager.tealPrimary800,
                                        onLabelColor: ColorsManager.twine,
                                        thumbColor: active
                                            ? ColorsManager.offWhite300
                                            : ColorsManager.tealPrimary800,
                                        trackColor:
                                            ColorsManager.tealPrimary1000,
                                        onChanged: (val) {
                                          onRoad = val;
                                          context
                                              .read<PasswordIconCubit>()
                                              .toggleOpenCloseIcon();
                                        },
                                      ),
                                      shownIcon: (val, active) =>
                                          CupertinoSwitch(
                                        value: active,
                                        activeColor:
                                            ColorsManager.tealPrimary800,
                                        onLabelColor: ColorsManager.twine,
                                        thumbColor: active
                                            ? ColorsManager.offWhite300
                                            : ColorsManager.tealPrimary800,
                                        trackColor:
                                            ColorsManager.tealPrimary1000,
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
                                BlocBuilder<PublicTripReserveCubit,
                                    PublicTripReserveState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                        loading: () => LoadingButton.loading(),
                                        orElse: () => LoadingButton(
                                              text: 'حجز الرحلة',
                                              onPressed: () {
                                                context
                                                    .read<
                                                        PublicTripReserveCubit>()
                                                    .requestPublicTrip(
                                                        PublicTripReserveRequest(
                                                            locationDescription:
                                                                addressController
                                                                    .text,
                                                            onRoad: onRoad,
                                                            publicDriverTripId:
                                                                publicTrip
                                                                    .tripId));
                                                addressController.text = '';
                                              },
                                            ));
                                  },
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ));
            });
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 20),
        padding: EdgeInsets.all(8),
        decoration: buildSectionDecoration(),
        child: SizedBox(
          width: 350,
          height: 250,
          child: Column(
            children: [
              VerticalSpace(5),
              FromToStationChart(
                from: publicTrip.startStation!,
                to: publicTrip.endStation!,
                insiderFlex: 1,
              ),
              VerticalSpace(10),
              Container(
                padding: EdgeInsets.all(8),
                decoration:
                    buildSectionDecoration(color: ColorsManager.darkTeal),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        publicTrip.imgUrl!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    HorizontalSpace(5),
                    Expanded(
                      child: Column(
                        children: [
                          ProfileTile(
                              iconPath: AssetsProvider.clockIcon,
                              tittle: publicTrip.tripStartTime!),
                          ProfileTile(
                              iconPath: AssetsProvider.calendarIcon,
                              tittle: publicTrip.tripDay!),
                          ProfileTile(
                              iconPath: AssetsProvider.calendarIcon,
                              tittle: publicTrip.tripDate!),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
