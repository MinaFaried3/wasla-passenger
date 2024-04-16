import 'package:wasla/app/shared/common/common_libs.dart';

class WaslaFeatureItem extends StatelessWidget {
  const WaslaFeatureItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onPressed,
  });

  final String iconPath;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: ColorsManager.darkTealBackground4,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: AppSvg(
                path: iconPath,
                height: 50.sp,
              ),
            ),
            FittedBox(
                child: Text(
              title,
              style: getRegularStyle(fontSize: 8),
            )),
          ],
        ),
      ),
    );
  }
}
