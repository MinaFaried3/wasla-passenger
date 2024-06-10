import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/presentation/widgets/section/list_section.dart';

class FollowersAndFollowings extends StatelessWidget {
  const FollowersAndFollowings({
    super.key,
    required this.followers,
    required this.followings,
  });

  final List<UserTileModel> followers;
  final List<UserTileModel> followings;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListSection(
              tittle: AppStrings.followers.tr(),
              list: followers,
              action: buildAnimatedCount(followers.length)),
        ),
        const HorizontalSpace(5),
        Expanded(
            child: ListSection(
                tittle: AppStrings.followings.tr(),
                list: followings,
                action: buildAnimatedCount(followings.length))),
      ],
    );
  }

  Widget buildAnimatedCount(int count) => TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: count),
      duration: DurationManager.s2,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Text(value.toString());
      });
}
