import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/followers/follower_item.dart';
import 'package:wasla/presentation/widgets/section/list_section.dart';

class FollowersAndFollowings extends StatelessWidget {
  const FollowersAndFollowings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListSection(
              tittle: AppStrings.followers.tr(),
              item: const FollowerItem(),
              viewedItemLength: 3,
              viewAllPressed: () {},
              action: buildAnimatedCount(3)),
        ),
        const HorizontalSpace(5),
        Expanded(
            child: ListSection(
                tittle: AppStrings.followings.tr(),
                item: const FollowerItem(),
                viewedItemLength: 5,
                viewAllPressed: () {},
                action: buildAnimatedCount(5))),
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
