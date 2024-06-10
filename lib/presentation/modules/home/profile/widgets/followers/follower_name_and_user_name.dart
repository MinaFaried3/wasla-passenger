import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';

class FollowersNameUserName extends StatelessWidget {
  const FollowersNameUserName({
    super.key,
    required this.user,
  });

  final UserTileModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              user.name,
              style: getBoldStyle(fontSize: 16.sp),
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
        Flexible(
          child: Text(
            user.userName,
            style: getLightStyle(
                fontSize: 8.sp, color: ColorsManager.tealPrimary400),
            textDirection: TextDirection.ltr,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
