import 'package:wasla/app/shared/common/common_libs.dart';

class Tittles extends StatelessWidget {
  const Tittles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
          child: Text(
            AppStrings.verifyYourAccountTitle.tr(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
          child: Text(
            AppStrings.verifyYourAccountSubtitle.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: FontSize.s16.sp),
          ),
        ),
      ],
    );
  }
}
