import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/notification/cubit/notification_cubit.dart';
import 'package:wasla/presentation/modules/notification/widgets/notification_item.dart';
import 'package:wasla/presentation/widgets/buttons/back_button.dart';
import 'package:wasla/presentation/widgets/retry.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.notification.tr()),
        leading: const AppBackButton(),
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const LoadingIndicator(),
              getNotificationFailure: (message) => Retry(
                  onPressed: () =>
                      context.read<NotificationCubit>().getNotification(),
                  text: message),
              getNotificationSuccess: (notifications) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => NotificationItem(
                        notificationModel: notifications[index],
                      ),
                  separatorBuilder: (context, index) => const VerticalSpace(10),
                  itemCount: notifications.length),
              orElse: () => const SizedBox());
        },
      ),
    );
  }
}
