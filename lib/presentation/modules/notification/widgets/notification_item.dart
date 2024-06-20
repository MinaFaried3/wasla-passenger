import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/helper_functions.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';
import 'package:wasla/presentation/widgets/animation/slidable_widget.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return AppSlidingWidget(
        duration: DurationManager.m750,
        child: Container(
          margin: AppPadding.leftRight,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsManager.darkTealBackground3.withOpacity(0.4),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: ConditionalBuilder(
                          condition: widget
                              .notificationModel.notificationImage.isNotEmpty,
                          onTrue: (context) => Image.network(
                            widget.notificationModel.notificationImage,
                            width: 100,
                            height: 100,
                          ),
                          onFalse: (context) => Image.asset(
                            AssetsProvider.logoIcon,
                            width: 75,
                            height: 75,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: widget.notificationModel.type.color,
                      child: AppSvg(
                        path: widget.notificationModel.type.iconPath,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
              const HorizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.notificationModel.notificationName.isNotEmpty
                        ? widget.notificationModel.notificationName
                        : 'Wasla',
                    style: getBoldStyle(fontSize: 20),
                  ),
                  FittedBox(
                    child: Text(
                      widget.notificationModel.description,
                      textDirection: TextDirection.ltr,
                      style: getMediumStyle(),
                    ),
                  ),
                  const VerticalSpace(20),
                  Row(
                    children: [
                      const AppSvg(path: AssetsProvider.clockIcon),
                      HorizontalSpace(5),
                      Text(
                        timeAgo(widget.notificationModel.notificationTime),
                        textDirection: TextDirection.ltr,
                        style: getLightStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.notificationModel.title,
                    textDirection: TextDirection.ltr,
                    style: getLightStyle(
                        fontSize: 16, color: ColorsManager.tealPrimary),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
