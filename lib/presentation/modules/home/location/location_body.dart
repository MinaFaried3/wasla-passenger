import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/location/follower_trip_cubit.dart';

class LocationBody extends StatefulWidget {
  const LocationBody({super.key});

  @override
  State<LocationBody> createState() => _LocationBodyState();
}

class _LocationBodyState extends State<LocationBody> {
  @override
  void initState() {
    super.initState();
    context.read<FollowerTripCubit>().getFollowerTrips();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowerTripCubit, FollowerTripState>(
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => LoadingIndicator(),
            getFollowerTripsSuccess: (passengers) => Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              passengers[index]
                                                  .customerImageUrl!,
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              passengers[index]
                                                  .companyImageUrl!,
                                              width: 30,
                                              height: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  VerticalSpace(10),
                                  Text(passengers[index].fullName!),
                                ],
                              ),
                          separatorBuilder: (context, index) =>
                              HorizontalSpace(10),
                          itemCount: passengers.length),
                    ),
                  ],
                ),
            orElse: () => SizedBox());
      },
    );
  }

  GoogleMap buildGoogleMap() {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(26.896944770405693, 31.44222427539095),
        zoom: 12,
      ),
    );
  }
}
