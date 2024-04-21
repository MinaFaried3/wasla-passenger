import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';

class NameAndUsername extends StatelessWidget {
  const NameAndUsername({
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
    return Expanded(child: LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$firstName $lastName",
            style: getBoldStyle(fontSize: 22.sp),
            textDirection: TextDirection.ltr,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          FittedBox(
            child: Text(
              "@$userName",
              style: getRegularStyle(
                color: ColorsManager.tealPrimary500,
                fontSize: 14.sp,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
          VerticalSpace(15.h),
          SizedBox(
            width: constraints.maxWidth * 0.35,
            height: 30.h,
            child: AppButton.dark(
              text: AppStrings.editProfile.tr(),
              svgIconPath: AssetsProvider.edit,
              matchFontColor: true,
              fontSize: 12.sp,
              iconSize: 18.sp,
              radius: 10,
              buttonType: ButtonContentType.iconText,
              onPressed: () {},
            ),
          ),
        ],
      );
    }));
  }
}
