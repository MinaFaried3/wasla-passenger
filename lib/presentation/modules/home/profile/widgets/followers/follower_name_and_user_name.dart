import 'package:wasla/app/shared/common/common_libs.dart';

class FollowersNameUserName extends StatelessWidget {
  const FollowersNameUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              'Mina Faried',
              style: getBoldStyle(fontSize: 16.sp),
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
              '@mina_faried',
              style: getLightStyle(
                  fontSize: 8.sp, color: ColorsManager.tealPrimary400),
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
