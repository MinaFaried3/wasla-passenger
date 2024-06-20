import '../common/common_libs.dart';

enum NotificationType {
  FollowReqeust(
    color: ColorsManager.tealPrimary700,
    iconPath: AssetsProvider.followPassengerIcon,
  ),
  PackageRequest(
    color: ColorsManager.twine,
    iconPath: Assets.svgPackageNotificationIcon,
  ),
  PackageAccept(
    color: ColorsManager.violet,
    iconPath: Assets.svgPackageNotificationIcon,
  ),
  AdsAccept(
    color: ColorsManager.violet,
    iconPath: AssetsProvider.adsIcon,
  ),
  TripAlarm(
    color: ColorsManager.red900,
    iconPath: Assets.svgRiskNotificationAlarm,
  );

  final Color color;
  final String iconPath;

  const NotificationType({
    required this.color,
    required this.iconPath,
  });
}
