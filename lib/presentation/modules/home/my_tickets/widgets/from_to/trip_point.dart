import 'package:wasla/app/shared/common/common_libs.dart';

class TripPoint extends StatelessWidget {
  const TripPoint({
    super.key,
    required this.tittle,
    required this.time,
    required this.city,
  });

  final String tittle;
  final String time;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            tittle,
            style: getBoldStyle(fontSize: 12.sp),
          ),
        ),
        FittedBox(
          child: Text(
            time,
            style: getMediumStyle(
                fontSize: 10.sp, color: ColorsManager.tealPrimary200),
            textDirection: TextDirection.ltr,
          ),
        ),
        FittedBox(
          child: Text(
            city,
            style: getSemiBoldStyle(
                fontSize: 20.sp, color: ColorsManager.tealPrimary400),
          ),
        ),
      ],
    );
  }
}
