import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton(
      {super.key, required this.containerPadding, required this.paddingBottom});

  final double containerPadding;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        containerPadding,
        AppConstants.doubleZero,
        AppConstants.doubleZero,
        paddingBottom,
      ),
      child: TextButton(
          onLongPress: () {
            context.read<BearDialogCubit>().forgetPasswordInfo();
          },
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.onBackground),
            textStyle: MaterialStatePropertyAll(
              getRegularStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: FontSize.s16.sp),
            ),
          ),
          //todo
          child: Text('نسيت كلمة المرور؟')),
    );
  }
}
