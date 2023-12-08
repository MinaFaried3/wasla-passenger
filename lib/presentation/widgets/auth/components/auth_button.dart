import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key, this.text, this.onPressed, this.isLoading = false});

  factory AuthButton.loading() => const AuthButton(
        isLoading: true,
      );

  final String? text;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        child: child,
      ),
      child: isLoading
          ? LoadingIndicator(
              height: responsive.getBodyHeightOf(AppSize.s0_2),
            )
          : AppButton(
              onPressed: onPressed ?? () {},
              text: text ?? AppConstants.emptyString,
            ),
    );
  }
}
