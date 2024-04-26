import 'package:wasla/app/shared/common/common_libs.dart';

class WelcomeText extends StatelessWidget {
  final String passengerName;

  const WelcomeText({super.key, required this.passengerName});

  @override
  Widget build(BuildContext context) {
    final responsive = ContextManager(context, hasAppBar: false);
    return DefaultTextStyle(
      style: getBoldStyle(fontSize: FontSize.s40.sp),
      child: SizedBox(
        width: responsive.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${AppStrings.welcomeWith.tr()} $passengerName'),
            Text(AppStrings.toWasla.tr()),
          ],
        ),
      ),
    );
  }
}
