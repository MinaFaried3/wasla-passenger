import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/my_tickets/cubit/coming_trip_cubit.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/ticket_item.dart';
import 'package:wasla/presentation/widgets/retry.dart';

class MyTicketsBody extends StatefulWidget {
  const MyTicketsBody({super.key});

  @override
  State<MyTicketsBody> createState() => _MyTicketsBodyState();
}

class _MyTicketsBodyState extends State<MyTicketsBody> {
  @override
  void initState() {
    super.initState();
    context.read<ComingTripCubit>().getComingTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.fromLR,
      ),
      child: BlocBuilder<ComingTripCubit, ComingTripState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => LoadingIndicator(),
              getComingTripsFailure: (message) => Retry(
                    onPressed: () =>
                        context.read<ComingTripCubit>().getComingTrips(),
                    text: message,
                  ),
              getComingTripsSuccess: (comingTrips) => CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList.separated(
                          itemBuilder: (context, index) => TicketItem(
                                comingTripModel: comingTrips[index],
                              ),
                          separatorBuilder: (context, index) =>
                              const VerticalSpace(10),
                          itemCount: comingTrips.length),
                      SliverToBoxAdapter(
                        child: VerticalSpace(100.h),
                      )
                    ],
                  ),
              orElse: () => SizedBox());
        },
      ),
    );
  }
}
