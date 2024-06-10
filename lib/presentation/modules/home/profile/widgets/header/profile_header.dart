import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/header/name_username.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.fullName,
    required this.photoUrl,
    required this.userName,
  });

  final String fullName;
  final String photoUrl;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildProfileImage(photoUrl),
        HorizontalSpace(15.w),
        NameAndUsername(fullName: fullName, userName: userName),
      ],
    );
  }

  ClipRRect buildProfileImage(String url) {
    double length = 140.h;
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Image.network(
        width: length,
        height: length,
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
