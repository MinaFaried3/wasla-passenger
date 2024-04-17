import 'package:wasla/app/shared/common/common_libs.dart';

class NearestTripTimer extends StatelessWidget {
  const NearestTripTimer({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorsManager.offWhite,
            borderRadius: BorderRadius.circular(35)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                AppStrings.yourTripWillStartThrough.tr(),
                style: getSemiBoldStyle(
                  color: ColorsManager.tealPrimary1000,
                  fontSize: 16,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                time,
                style:
                    getBoldStyle(color: ColorsManager.twine, fontSize: 40.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
