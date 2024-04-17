import 'package:wasla/app/shared/common/common_libs.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.tittle,
    required this.iconPath,
    this.iconSize,
    this.fontSize,
    this.iconColor = ColorsManager.offWhite300,
  });

  final String tittle;
  final String iconPath;
  final Color iconColor;
  final double? iconSize;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSvg(
          path: iconPath,
          color: iconColor,
          height: iconSize,
        ),
        const HorizontalSpace(5),
        FittedBox(
          child: Text(
            tittle,
            style: getMediumStyle(
              fontSize: fontSize?.sp ?? 12.sp,
            ),
          ),
        )
      ],
    );
  }
}
