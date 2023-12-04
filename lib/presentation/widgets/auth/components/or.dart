import 'package:wasla/app/shared/common/common_libs.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.getWidthOf(AppSize.s0_075),
        vertical: responsive.getScreenHeightOf(AppSize.s0_015),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildDivider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsive.getWidthOf(AppSize.s0_015)),
            child: Text(
              AppStrings.or.tr(),
              style: getLightStyle(
                  color: ColorsManager.offWhite500, fontSize: FontSize.s24.sp),
            ),
          ),
          Expanded(
            child: _buildDivider(),
          ),
        ],
      ),
    );
  }

  SizedBox _buildDivider() {
    return SizedBox(
      height: AppSize.s0_5,
      child: ColoredBox(
        color: ColorsManager.offWhite300.withOpacity(AppSize.s0_1),
      ),
    );
  }
}
