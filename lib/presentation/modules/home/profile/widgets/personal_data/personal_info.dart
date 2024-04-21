import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/profile_tile.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required this.id,
    required this.phone,
    required this.email,
    required this.birthdate,
    required this.maleOrFemale,
  });

  final String id;
  final String phone;
  final String email;
  final String birthdate;
  final String maleOrFemale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTile(
          iconPath: AssetsProvider.idIcon,
          tittle: id,
        ),
        ProfileTile(
          iconPath: AssetsProvider.phoneIcon,
          tittle: phone,
        ),
        ProfileTile(
          iconPath: AssetsProvider.emailIcon,
          tittle: email,
        ),
        ProfileTile(
          iconPath: AssetsProvider.birthdate,
          tittle: birthdate,
        ),
        ProfileTile(
          iconPath: AssetsProvider.maleFemale,
          tittle: maleOrFemale,
        ),
      ],
    );
  }
}
