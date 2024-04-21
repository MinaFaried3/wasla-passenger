import 'package:wasla/app/shared/common/common_libs.dart';

class Sponsor extends StatelessWidget {
  const Sponsor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: ColorsManager.red900,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          'sponsored by wasla',
          style: getLightStyle(fontSize: 10.sp),
        ),
      ),
    );
  }
}
