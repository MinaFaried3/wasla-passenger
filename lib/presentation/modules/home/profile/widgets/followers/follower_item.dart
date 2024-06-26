import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/followers/follower_name_and_user_name.dart';

class FollowerItem extends StatelessWidget {
  const FollowerItem({
    super.key,
    required this.user,
  });

  final UserTileModel user;

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 40.w;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
      child: SizedBox(
        height: itemHeight,
        child: Row(
          children: [
            //profile image
            buildProfileImage(itemHeight),
            const HorizontalSpace(5),

            //names column
            Expanded(
              child: FollowersNameUserName(
                user: user,
              ),
            ),

            //delete follower button
            SizedBox(
              width: 30.w,
              height: 30.w,
              child: buildRemoveFollowerButton(),
            ),
          ],
        ),
      ),
    );
  }

  OutlinedButton buildRemoveFollowerButton() {
    return OutlinedButton(
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          fixedSize: MaterialStatePropertyAll(Size(20, 20)),
        ),
        onPressed: () {},
        child: const AppSvg(
          path: AssetsProvider.trashIcon,
          height: 15,
          color: ColorsManager.red800,
        ));
  }

  Image buildProfileImage(double itemHeight) {
    return Image.network(
      user.photoUrl,
      width: itemHeight,
      height: itemHeight,
    );
  }
}
