import 'package:flutter/services.dart';
import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/cubit/edit_contacts_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/otp_lottie.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_buttons.dart';
import 'package:wasla/presentation/modules/account_verification/widgets/titles.dart';

class VerificationWayScreen extends StatefulWidget {
  const VerificationWayScreen({super.key});

  @override
  State<VerificationWayScreen> createState() => _VerificationWayScreenState();
}

class _VerificationWayScreenState extends State<VerificationWayScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context);
    return PopScope(
      onPopInvoked: (canPop) => SystemNavigator.pop(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: responsive.appBarHeight,
          automaticallyImplyLeading: false,
          actions: [buildSkipButton()],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Titles(
                title: AppStrings.verifyYourAccountTitle,
                subTitle: AppStrings.verifyYourAccountSubtitle,
              ),
              VerticalSpace(AppSize.s20.h),
              const OtpLottie(),
              VerticalSpace(AppSize.s50.h),
              const VerificationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSkipButton() {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: AppPadding.p18.sp),
      child: TextButton(
        onPressed: () {
          getIt<AppPreferences>().setData<bool>(
              key: PrefKeys.isDoneAccountVerification, data: true);
          context.pushNamedAndRemoveUntil(Routes.start.path);
          DIModulesManger.disposeBloc<EditContactsCubit>();
        },
        child: Text(
          AppStrings.skip.tr(),
          style: getSemiBoldStyle(
            color: ColorsManager.tealPrimary1000,
            fontSize: FontSize.s24.sp,
          ),
        ),
      ),
    );
  }
}
