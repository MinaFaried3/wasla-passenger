import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/services/validator/validator_input_formatter.dart';
import 'package:wasla/app/services/validator/validator_manager.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/cubit/edit_contacts_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/slide_button_widget.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_template.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';

class EditPhoneScreen extends StatefulWidget {
  const EditPhoneScreen({
    super.key,
  });

  @override
  State<EditPhoneScreen> createState() => _EditPhoneScreenState();
}

class _EditPhoneScreenState extends State<EditPhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VerificationTemplate(
        title: AppStrings.editYourOwnPhone,
        subTitle: AppStrings.yourPhoneShouldBe,
        imgPath: AssetsProvider.editPhone,
        child: Form(
          key: key,
          child: SlideBottomWidgets(
            firstChild: AppTextFormField(
              controller: phoneController,
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
              onFieldSubmitted: (phone) => onPressedEditPhone(context),
              validator: ValidatorManager.validatePhone,
            ),
            secondChild: BlocConsumer<EditContactsCubit, EditContactsState>(
              listener: editPhoneListener,
              builder: editPhoneButtonBuilder,
            ),
          ),
        ));
  }

  void editPhoneListener(BuildContext context, EditContactsState state) {
    state.whenOrNull(
      editPhoneSuccessState: (message) =>
          whenEditPhoneSuccess(context, message),
      editPhoneFailureState: (message) => showAppToast(message),
    );
  }

  Widget editPhoneButtonBuilder(BuildContext context, EditContactsState state) {
    return state.maybeWhen(
        loadingState: () => LoadingButton.loading(),
        orElse: () => LoadingButton(
              text: AppStrings.verifyNow.tr(),
              onPressed: () => onPressedEditPhone(context),
            ));
  }

  void whenEditPhoneSuccess(BuildContext context, String message) {
    context.read<LocalCubit>().getPassengerModelConnections();
    showAppToast(message);
    context.pop();
  }

  void onPressedEditPhone(BuildContext context) {
    if (key.currentState?.validate() == true) {
      context.read<EditContactsCubit>().editPhone(phoneController.text);
    }
  }
}
