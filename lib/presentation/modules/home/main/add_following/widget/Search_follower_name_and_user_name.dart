import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';

class SearchFollowersNameUserName extends StatelessWidget {
  const SearchFollowersNameUserName({
    super.key,
    required this.fullName,
    required this.username,
  });

  final String fullName, username;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fullName.orEmpty(),
          style: getBoldStyle(fontSize: 25),
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
        ),
        VerticalSpace(5),
        Text(
          username.orEmpty(),
          style:
              getLightStyle(fontSize: 18, color: ColorsManager.tealPrimary400),
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
        ),
      ],
    );
  }
}
