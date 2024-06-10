import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/responses/home/profile/profile_response.dart';
import 'package:wasla/presentation/modules/home/main/add_following/cubit/create_follow_cubit.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';

import 'Search_follower_name_and_user_name.dart';

class SearchFollowerItem extends StatelessWidget {
  const SearchFollowerItem({
    super.key,
    required this.user,
  });

  final PassengerItemModel user;

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
      child: Column(
        children: [
          Row(
            children: [
              //profile image
              if (user.photoUrl != null)
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: buildProfileImage(itemHeight)),
              const HorizontalSpace(5),
              HorizontalSpace(10),
              //names column
              SearchFollowersNameUserName(
                fullName: user.fullName!,
                username: user.userName!,
              ),

              //delete follower button
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<CreateFollowCubit, CreateFollowState>(
              listener: (context, state) {
                state.whenOrNull(
                  createFollowRequestSuccess: (message) {
                    showAppToast(message);
                    context.pop();
                  },
                  createFollowRequestFailure: (message) =>
                      showAppToast(message),
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                    createFollowRequestloading: () => LoadingIndicator(
                          height: 100,
                        ),
                    createFollowRequestSuccess: (message) => Text(message),
                    createFollowRequestFailure: (message) => Text(message),
                    orElse: () => AppButton.dark(
                        text: 'متابعة',
                        onPressed: () {
                          context
                              .read<CreateFollowCubit>()
                              .createFollowRequest(user.id!);
                        }));
              },
            ),
          )
        ],
      ),
    );
  }

  Image buildProfileImage(double itemHeight) {
    return Image.network(
      user.photoUrl!,
      width: itemHeight,
      height: itemHeight,
    );
  }
}
