import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/follow_request/cubit/action_follow_request_cubit.dart';
import 'package:wasla/presentation/modules/follow_request/cubit/follow_request_cubit.dart';
import 'package:wasla/presentation/modules/home/main/add_following/widget/Search_follower_name_and_user_name.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';
import 'package:wasla/presentation/widgets/retry.dart';

class FollowRequestScreen extends StatefulWidget {
  const FollowRequestScreen({super.key});

  @override
  State<FollowRequestScreen> createState() => _FollowRequestScreenState();
}

class _FollowRequestScreenState extends State<FollowRequestScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FollowRequestCubit>().getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلبات المتابعة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FollowRequestCubit, FollowRequestState>(
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => LoadingIndicator(),
                getNotificationFailure: (message) => Retry(
                      onPressed: () =>
                          context.read<FollowRequestCubit>().getRequests(),
                      text: message,
                    ),
                getNotificationSuccess: (requests) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                requests[index].photoUrl!,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            HorizontalSpace(10),
                            SearchFollowersNameUserName(
                                fullName: requests[index].name!,
                                username: requests[index].userName!),
                            Spacer(),
                            Column(
                              children: [
                                buildActionButton(
                                    true, requests[index].followingId!),
                                buildActionButton(
                                    false, requests[index].followingId!),
                              ],
                            )
                          ],
                        ),
                    separatorBuilder: (context, index) => VerticalSpace(20),
                    itemCount: requests.length),
                orElse: () => SizedBox());
          },
        ),
      ),
    );
  }

  Widget buildActionButton(bool accept, String followerId) {
    return BlocListener<ActionFollowRequestCubit, ActionFollowRequestState>(
      listener: (context, state) {
        state.whenOrNull(
          actionFollowRequestFailure: (message) => showAppToast(message),
          actionFollowRequestSuccess: (message) => showAppToast(message),
        );
      },
      child: OutlinedButton(
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            fixedSize: WidgetStatePropertyAll(Size(30, 30)),
          ),
          onPressed: () {
            context
                .read<ActionFollowRequestCubit>()
                .takeFollowAction(accept, followerId);
          },
          child: AppSvg(
            path: accept ? AssetsProvider.doneIcon : AssetsProvider.trashIcon,
            height: 15,
            color: accept ? ColorsManager.tealPrimary300 : ColorsManager.red800,
          )),
    );
  }
}
