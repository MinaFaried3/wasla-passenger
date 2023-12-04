import 'package:wasla/app/shared/common/common_libs.dart';

class AuthNow extends StatelessWidget {
  final String caption;
  final String buttonName;
  final String routeName;

  const AuthNow(
      {super.key,
      required this.caption,
      required this.buttonName,
      required this.routeName});

  factory AuthNow.register({
    String caption = AppStrings.doNotHaveAccount,
    String buttonName = AppStrings.createAccount,
    String? routeName,
  }) =>
      AuthNow(
        caption: caption.tr(),
        buttonName: buttonName.tr(),
        routeName: routeName ?? Routes.registerRoute.routeString,
      );

  factory AuthNow.login({
    String caption = AppStrings.haveAccount,
    String buttonName = AppStrings.loginNow,
    String? routeName,
  }) =>
      AuthNow(
        caption: caption.tr(),
        buttonName: buttonName.tr(),
        routeName: routeName ?? Routes.loginRoute.routeString,
      );

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Padding(
      padding: EdgeInsets.only(
          top: responsive.getScreenHeightPercentage(AppSize.s3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //todo RichText(text: text)
          Text(
            caption,
            style: getExtraLightStyle(
              color: ColorsManager.offWhite400,
              fontSize: FontSize.s22.sp,
            ),
          ),
          TextButton(
            style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                    getRegularStyle(fontSize: FontSize.s28.sp))),
            onPressed: () {
              _onPressed(context);
            },
            child: Text(
              buttonName,
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed(BuildContext context) {
    //that is mean now i am on register
    if (routeName == Routes.loginRoute.routeString) {
      if (context.canPop()) {
        context.pop();
        return;
      }
    }
    context.pushNamed(routeName);
  }
}
