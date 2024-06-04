import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/code_digit_form_field.dart';

class VerificationCodeFields extends StatelessWidget {
  const VerificationCodeFields({
    super.key,
    required this.digitsControllers,
  });

  final List<TextEditingController> digitsControllers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < AppConstants.otpCodeLength; i++)
                CodeDigitFormField(
                  controller: digitsControllers[i],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
