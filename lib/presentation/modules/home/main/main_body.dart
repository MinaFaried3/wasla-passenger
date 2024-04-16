import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/ads_slider.dart';
import 'package:wasla/presentation/modules/home/main/widgets/nearest_trip.dart';
import 'package:wasla/presentation/modules/home/main/widgets/neartest_trip_content.dart';
import 'package:wasla/presentation/modules/home/main/widgets/wasla_features.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //nearestTrip
          SectionWithTitle(
            tittle: AppStrings.nearestTrip.tr(),
            content: const NearestTripContent(),
          ),

          //wasla features
          const WaslaFeatures(),

          //ads
          SectionWithTitle(
            tittle: AppStrings.ourServices.tr(),
            content: const AdsSlider(),
            enableContentPadding: false,
          ),

          //discover trips
        ],
      ),
    );
  }
}
