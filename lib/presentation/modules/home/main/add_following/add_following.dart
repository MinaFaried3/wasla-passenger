import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/generated/app_image.dart';
import 'package:wasla/presentation/modules/home/main/add_following/cubit/follow_cubit.dart';
import 'package:wasla/presentation/modules/home/main/add_following/widget/search_follower_item.dart';
import 'package:wasla/presentation/widgets/dialog.dart';

class AddFollowingDialog extends StatefulWidget {
  const AddFollowingDialog({
    super.key,
  });

  @override
  State<AddFollowingDialog> createState() => _AddFollowingDialogState();
}

class _AddFollowingDialogState extends State<AddFollowingDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: AppTextFormField(
                      controller: controller,
                      labelText: AppStrings.username.tr(),
                    )),
                    IconButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty)
                            context
                                .read<FollowCubit>()
                                .searchByUserName(controller.text);
                        },
                        icon: const AppSvg(
                          path: AssetsProvider.searchIcon,
                          height: 35,
                        )),
                  ],
                ),
                VerticalSpace(80),
                BlocBuilder<FollowCubit, FollowState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        loading: () => LoadingIndicator(),
                        getPassengerFollowItemFailure: (message) => Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.pngEmptySearch,
                                    height: 200,
                                  ),
                                  Text(message)
                                ],
                              ),
                            ),
                        getPassengerFollowItemSuccess: (passenger) =>
                            SearchFollowerItem(user: passenger),
                        orElse: () => SizedBox());
                  },
                )
              ],
            ),
          ),
        ));
  }
}
