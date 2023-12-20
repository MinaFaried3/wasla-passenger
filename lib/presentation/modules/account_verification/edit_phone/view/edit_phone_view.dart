import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/services/validator/validator_input_formatter.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/slide_button_widget.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_template.dart';

class EditPhoneScreen extends StatelessWidget {
  final String? title;
  final String phone;

  const EditPhoneScreen({
    super.key,
    required this.phone,
    this.title = AppStrings.editYourOwnPhone,
  });

  @override
  Widget build(BuildContext context) {
    return VerificationTemplate(
        contact: phone,
        title: title!,
        subTitle: AppStrings.yourPhoneShouldBe,
        imgPath: AssetsProvider.editPhone,
        child: SlideBottomWidgets(
          firstChild: AppTextFormField(
            textDirection: TextDirection.ltr,
            labelText: AppStrings.phone.tr(),
            svgPrefixPath: AssetsProvider.phoneIcon,
            autofillHints: const [AutofillHints.telephoneNumber],
            textInputType: TextInputType.phone,
            inputFormatters: [
              ValidatorInputFormatter(
                editingFormatter: const PhoneNumberEditingRegexValidator(),
              )
            ],
            onFieldSubmitted: (phone) {
              //todo
            },
            validator: (phone) {
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
