import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/services/validator/validator_input_formatter.dart';
import 'package:wasla/app/services/validator/validator_manager.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';

class ContactsFormFields extends StatefulWidget {
  const ContactsFormFields({
    super.key,
    required this.contactsFormKey,
    required this.phoneController,
    required this.emailController,
    this.withDialog = true,
  });

  final GlobalKey<FormState> contactsFormKey;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final bool withDialog;

  @override
  State<ContactsFormFields> createState() => _ContactsFormFieldsState();
}

class _ContactsFormFieldsState extends State<ContactsFormFields> {
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ContextManager(context, hasAppBar: false);

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_03);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);
    return Form(
      key: widget.contactsFormKey,
      child: Column(
        children: [
          //phone filed
          Padding(
            padding: EdgeInsets.only(
                bottom: responsive.getScreenHeightOf(AppSize.s0_01)),
            child: AppTextFormField(
              controller: widget.phoneController,
              textDirection: TextDirection.ltr,
              focusNode: phoneFocusNode,
              textInputType: TextInputType.phone,
              inputFormatters: [
                ValidatorInputFormatter(
                  editingFormatter: const PhoneNumberEditingRegexValidator(),
                )
              ],
              validator: (phone) => _validateContactsForm(
                  email: widget.emailController.text, phone: phone),
              onChanged: _onChange,
              textInputAction: TextInputAction.next,
              labelText: AppStrings.phone.tr(),
              svgPrefixPath: AssetsProvider.phoneIcon,
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
          ),

          //email filed
          Padding(
            padding: edgeInsetsBottom,
            child: AppTextFormField(
              controller: widget.emailController,
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              labelText: AppStrings.email2.tr(),
              svgPrefixPath: AssetsProvider.emailIcon,
              inputFormatters: [
                ValidatorInputFormatter(
                  editingFormatter: const EmailEditingRegexValidator(),
                )
              ],
              validator: (email) => _validateContactsForm(
                  email: email, phone: widget.phoneController.text),
              onChanged: _onChange,
              autofillHints: const [AutofillHints.email],
            ),
          ),
        ],
      ),
    );
  }

  void _dispose() {
    if (widget.withDialog) {
      emailFocusNode.removeListener(_emailListener);
      phoneFocusNode.removeListener(_phoneListener);
    }
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
  }

  _init() {
    if (widget.withDialog) {
      context
          .read<BearDialogCubit>()
          .writeMessage(AppStrings.startContactsForm.tr());

      emailFocusNode.addListener(_emailListener);
      phoneFocusNode.addListener(_phoneListener);
      phoneFocusNode.requestFocus();
    }

    if (context.read<BearAnimationCubit>().riveController.currentState ==
        BearState.handsUp) {
      context
          .read<BearAnimationCubit>()
          .riveController
          .addState(BearState.handsDown);
    }
  }

  void _emailListener() {
    if (emailFocusNode.hasFocus) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.emailInfo.tr());
    }
  }

  void _phoneListener() {
    if (phoneFocusNode.hasFocus) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.phoneInfo.tr());
    }
  }

  void _onChange(String contact) {
    context
        .read<BearAnimationCubit>()
        .riveController
        .followFieldText(value: contact);
  }

  String? _validateContactsForm({
    required String? email,
    required String? phone,
  }) {
    String? isValidEmail = ValidatorManager.validateEmail(email);
    String? isValidPhone = ValidatorManager.validatePhone(phone);

    if (isValidEmail == null || isValidPhone == null) {
      return null;
    }
    context
        .read<BearDialogCubit>()
        .writeMessage(AppStrings.youMustEnterAtLeastOneContact.tr());
    return AppStrings.cannotBeEmpty.tr();
  }
}
