import 'package:wasla/app/shared/common/common_libs.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.iconPath,
    required this.tittle,
  });

  final String iconPath;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.sp),
      child: Row(
        children: [
          AppSvg(
            path: iconPath,
            color: ColorsManager.tealPrimary800,
            height: 28.sp,
          ),
          const HorizontalSpace(10),
          Flexible(
            child: FittedBox(
              child: Text(
                tittle,
                style: getLightStyle(
                    fontSize: 16.sp, color: ColorsManager.offWhite500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
