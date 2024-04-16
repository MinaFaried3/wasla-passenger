import 'package:wasla/app/shared/common/common_libs.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.tittle,
    required this.iconPath,
  });

  final String tittle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSvg(
          path: iconPath,
          color: ColorsManager.offWhite300,
        ),
        const HorizontalSpace(5),
        FittedBox(
          child: Text(
            tittle,
            style: getMediumStyle(fontSize: 12.sp),
          ),
        )
      ],
    );
  }
}
