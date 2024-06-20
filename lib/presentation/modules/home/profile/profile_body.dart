import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/cubit/profile_cubit.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/followers/following_and_followers_section.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/header/profile_header.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/personal_info_free_trip_section.dart';
import 'package:wasla/presentation/widgets/retry.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.screenPadding),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const LoadingIndicator(),
              getProfileSuccess: (profile) => SingleChildScrollView(
                    child: Column(
                      children: [
                        //user name and img
                        ProfileHeader(
                          fullName: profile.fullName,
                          photoUrl: profile.photoUrl,
                          userName: profile.userName,
                        ),

                        VerticalSpace(30.h),

                        //contacts and points chart
                        PersonalInfoAndFreeTripChart(
                          id: profile.id,
                          phone: profile.phoneNumber,
                          email: profile.email,
                          birthdate: profile.birthdate,
                          maleOrFemale: profile.gender.name,
                          points: profile.points,
                        ),
                        VerticalSpace(30.h),

                        FollowersAndFollowings(
                          followers: profileCubit.followers,
                          followings: profileCubit.following,
                        ),

                        VerticalSpace(100.h),
                      ],
                    ),
                  ),
              getProfileFailure: (message) => Retry(
                  onPressed: () => context.read<ProfileCubit>().getProfile(),
                  text: message),
              orElse: () => const SizedBox.shrink());
        },
      ),
    );
  }
}
