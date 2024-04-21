import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/header/name_username.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.userName,
  });

  final String firstName;
  final String lastName;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildProfileImage(),
        HorizontalSpace(15.w),
        NameAndUsername(
            firstName: firstName, lastName: lastName, userName: userName),
      ],
    );
  }

  ClipRRect buildProfileImage() {
    double length = 140.h;
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Image.asset(
        width: length,
        height: length,
        AssetsProvider.minaUserImg,
        fit: BoxFit.cover,
      ),
    );
  }
}
