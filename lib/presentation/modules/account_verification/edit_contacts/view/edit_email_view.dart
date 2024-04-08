import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/services/validator/validator_input_formatter.dart';
import 'package:wasla/app/services/validator/validator_manager.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/cubit/edit_contacts_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/slide_button_widget.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_template.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({
    super.key,
  });

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VerificationTemplate(
        title: AppStrings.editYourOwnEmail,
        subTitle: AppStrings.yourEmailShouldBe,
        imgPath: AssetsProvider.editEmail,
        child: SlideBottomWidgets(
          firstChild: Form(
            key: key,
            child: AppTextFormField(
              controller: emailController,
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
              onFieldSubmitted: (email) => onPressedEditEmail(context),
              validator: ValidatorManager.validateEmail,
            ),
          ),
          secondChild: BlocConsumer<EditContactsCubit, EditContactsState>(
            listener: editEmailListener,
            builder: editEmailButtonBuilder,
          ),
        ));
  }

  void editEmailListener(BuildContext context, EditContactsState state) {
    state.whenOrNull(
      editEmailSuccessState: (message) =>
          whenEditEmailSuccess(context, message),
      editEmailFailureState: (message) => showAppToast(message),
    );
  }

  Widget editEmailButtonBuilder(BuildContext context, EditContactsState state) {
    return state.maybeWhen(
        loadingState: () => LoadingButton.loading(),
        orElse: () => LoadingButton(
              text: AppStrings.verifyNow.tr(),
              onPressed: () => onPressedEditEmail(context),
            ));
  }

  void whenEditEmailSuccess(BuildContext context, String message) {
    context.read<LocalCubit>().getPassengerModelConnections();
    showAppToast(message);
    context.pop();
  }

  void onPressedEditEmail(BuildContext context) {
    if (key.currentState?.validate() == true) {
      context.read<EditContactsCubit>().editEmail(emailController.text);
    }
  }
}
