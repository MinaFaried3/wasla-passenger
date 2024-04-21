import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/followers/following_and_followers_section.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/header/profile_header.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/personal_info_free_trip_section.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  final String firstName = "Mina";
  final String lastName = "Faried";
  final String userName = "mina_faried";
  final String phone = "01207340018";
  final String email = "mina@gmail.com";
  final String birthdate = "29 Aug,2001";
  final String maleOrFemale = "male";
  final String id = "12345678";
  final int points = 75;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.fromLR),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //user name and img
            ProfileHeader(
              firstName: firstName,
              lastName: lastName,
              userName: userName,
            ),

            VerticalSpace(30.h),

            //contacts and points chart
            PersonalInfoAndFreeTripChart(
              id: id,
              phone: phone,
              email: email,
              birthdate: birthdate,
              maleOrFemale: maleOrFemale,
              points: points,
            ),
            VerticalSpace(30.h),
            const FollowersAndFollowings(),
            VerticalSpace(100.h),
          ],
        ),
      ),
    );
  }
}
