import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/main/widgets/feature_item.dart';

class WaslaFeatures extends StatelessWidget {
  const WaslaFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.fromLR),
      child: Row(
        children: [
          WaslaFeatureItem(
            iconPath: AssetsProvider.shippingIcon,
            title: AppStrings.shippingService.tr(),
            onPressed: () {},
          ),
          WaslaFeatureItem(
            iconPath: AssetsProvider.followPassengerIcon,
            title: AppStrings.passengerFollowing.tr(),
            onPressed: () {},
          ),
          WaslaFeatureItem(
            iconPath: AssetsProvider.adsIcon,
            title: AppStrings.ads.tr(),
            onPressed: () {},
          ),
          WaslaFeatureItem(
            iconPath: AssetsProvider.seatsPositionIcon,
            title: AppStrings.seatPosition.tr(),
            onPressed: () {},
          ),
          WaslaFeatureItem(
            iconPath: AssetsProvider.privateBusIcon,
            title: AppStrings.privateBus.tr(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
