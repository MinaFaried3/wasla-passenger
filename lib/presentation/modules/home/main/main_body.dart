import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/ads/ads_slider.dart';
import 'package:wasla/presentation/modules/home/main/widgets/features/wasla_features.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip/neartest_trip_content.dart';
import 'package:wasla/presentation/modules/home/main/widgets/suggestions_trips/suggestions_trips_content.dart';
import 'package:wasla/presentation/widgets/section/section_with_tittle.dart';
import 'package:wasla/presentation/widgets/section/sliver_section_tittle.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        //nearestTrip
        SliverToBoxAdapter(
          child: SectionWithTitle(
            tittle: AppStrings.nearestTrip.tr(),
            content: const NearestTripContent(),
          ),
        ),

        //wasla features
        const SliverToBoxAdapter(child: WaslaFeatures()),

        //ads
        SliverToBoxAdapter(
          child: SectionWithTitle(
            tittle: AppStrings.ourServices.tr(),
            content: const AdsSlider(),
            enableContentPadding: false,
          ),
        ),

        //discover trips title with more button
        SliverSectionHead(
          tittle: AppStrings.discoverYourTrips.tr(),
          action: TextButton(
            child: Text(
              AppStrings.more.tr(),
              style: getSemiBoldStyle(
                fontSize: 12,
                color: ColorsManager.tealPrimary,
              ),
            ),
            onPressed: () {},
          ),
        ),
        //discover content => sliver padding => sliver grid
        const SuggestionTripsContent(),

        const SliverPadding(padding: EdgeInsets.only(bottom: 100))
      ],
    );
  }
}
