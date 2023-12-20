import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/services/validator/validator_input_formatter.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/slide_button_widget.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_template.dart';

class EditEmailScreen extends StatelessWidget {
  final String? title;
  final String email;

  const EditEmailScreen(
      {super.key,
      required this.email,
      this.title = AppStrings.editYourOwnEmail});

  @override
  Widget build(BuildContext context) {
    return VerificationTemplate(
        contact: email,
        title: title!,
        subTitle: AppStrings.yourEmailShouldBe,
        imgPath: AssetsProvider.editEmail,
        child: SlideBottomWidgets(
          firstChild: AppTextFormField(
            textInputType: TextInputType.emailAddress,
            textDirection: TextDirection.ltr,
            labelText: AppStrings.email2.tr(),
            hintText: AppConstants.emailSample,
            svgPrefixPath: AssetsProvider.emailIcon,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [
              ValidatorInputFormatter(
                editingFormatter: const EmailEditingRegexValidator(),
              )
            ],
            onFieldSubmitted: (email) {
              //todo
            },
            validator: (email) {
              return null;
              //todo
            },
          ),
          secondChild: AppButton(
            text: AppStrings.verifyNow.tr(),
            onPressed: () {},
          ),
        ));
  }
}
