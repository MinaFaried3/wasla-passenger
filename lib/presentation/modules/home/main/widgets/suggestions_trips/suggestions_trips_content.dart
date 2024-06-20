import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/cubit/main_home_cubit.dart';
import 'package:wasla/presentation/modules/home/main/widgets/suggestions_trips/gird_ticket_item.dart';
import 'package:wasla/presentation/widgets/retry.dart';

class SuggestionTripsContent extends StatelessWidget {
  const SuggestionTripsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        return state.map(
          initial: (initial) =>
              const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: (loading) =>
              const SliverToBoxAdapter(child: LoadingIndicator()),
          getSuggestionsTripsSuccess: (trips) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.screenPadding),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 19 / 20),
                itemCount: trips.trips.length,
                itemBuilder: (context, index) {
                  return GridTicketItem(
                    tripModel: trips.trips[index],
                  );
                },
              ),
            );
          },
          getSuggestionsTripsFailure: (message) => SliverToBoxAdapter(
            child: Retry(
              onPressed: () =>
                  context.read<MainHomeCubit>().getSuggestionsTrips(),
              text: message.message,
            ),
          ),
        );
      },
    );
  }
}
