import '../../../app/shared/common/common_libs.dart';

BoxDecoration buildSectionDecoration(
    {double radius = 35, Color color = ColorsManager.tealPrimary1000}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
  );
}
