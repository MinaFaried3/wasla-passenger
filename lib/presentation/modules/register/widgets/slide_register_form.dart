import 'dart:async';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/register/controller/form_controller.dart';
import 'package:wasla/presentation/modules/register/cubit/form_index_cubit.dart';
import 'package:wasla/presentation/modules/register/cubit/register_cubit.dart';
import 'package:wasla/presentation/modules/register/widgets/contacts_form_fields.dart';
import 'package:wasla/presentation/modules/register/widgets/form_controller_indicator.dart';
import 'package:wasla/presentation/modules/register/widgets/names_form_fields.dart';
import 'package:wasla/presentation/modules/register/widgets/password_form_fields.dart';
import 'package:wasla/presentation/widgets/auth/components/auth_button.dart';

class SlideRegisterForm extends StatefulWidget {
  final RiveControllerManager riveController;

  const SlideRegisterForm({
    super.key,
    required this.riveController,
  });

  @override
  State<SlideRegisterForm> createState() => _SlideRegisterFormState();
}

class _SlideRegisterFormState extends State<SlideRegisterForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizedAnimation;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  //form keys
  final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> contactsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  late final List<FormViewContent> forms;

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
    //container padding and radius
    const double containerPadding = AppPadding.p8;
    const double containerRadius = containerPadding + AppSize.s20;

    //return
    return Container(
      padding: const EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(
          color: ColorsManager.darkTeal,
          borderRadius: BorderRadius.circular(containerRadius)),
      child: BlocBuilder<FormIndexCubit, int>(
        builder: (context, formIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //form
              ScaleTransition(
                alignment: Alignment.bottomCenter,
                scale: _sizedAnimation,
                child: forms[formIndex].form,
              ),

              //indicator
              FormControllerIndicator(
                animationController: _animationController,
                currentFromKey: forms[formIndex].key,
                length: forms.length,
              ),

              //register button
              if (formIndex == forms.length - 1)
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) =>
                      _bearDialogRegisterListener(state, context),
                  builder: (context, state) {
                    return state.maybeWhen(
                        loading: () => AuthButton.loading(),
                        orElse: () => AuthButton(
                              text: AppStrings.register.tr(),
                              onPressed: _onPressedRegister,
                            ));
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  void _bearDialogRegisterListener(RegisterState state, BuildContext context) {
    state.whenOrNull(error: (failure) {
      context.read<BearDialogCubit>().writeMessage(failure.message);
      widget.riveController.addState(BearState.fail);
    }, success: (passengerModel) {
      context.read<BearDialogCubit>().writeMessage(
          '${AppStrings.registerSuccess.tr()} ${passengerModel.firstName}');

      widget.riveController.addState(BearState.success);

      Timer(DurationManager.s2, () {
        context.pushNamedAndRemoveUntil(Routes.start.path,
            arguments: passengerModel.firstName);
      });
    });
  }

  void _onPressedRegister() async {
    passwordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
    await _addDelay();
    if (context.mounted) {
      context.read<RegisterCubit>().register(
          RegisterRequestBody(
            username: usernameController.text,
            firstname: firstnameController.text,
            lastname: lastnameController.text,
            phone: phoneController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
          confirmPasswordController.text);
    }
  }

  Future<void> _addDelay() async {
    if (widget.riveController.currentState == BearState.handsUp) {
      await Future.delayed(DurationManager.bearHandsDownDuration);
    }
  }

  void _init() {
    forms = [
      //names form fields
      FormViewContent(
        key: namesFormKey,
        form: NamesFormFields(
          namesFormKey: namesFormKey,
          usernameController: usernameController,
          lastnameController: lastnameController,
          firstnameController: firstnameController,
        ),
      ),

      //contacts
      FormViewContent(
        key: contactsFormKey,
        form: ContactsFormFields(
          contactsFormKey: contactsFormKey,
          emailController: emailController,
          phoneController: phoneController,
        ),
      ),

      //password
      FormViewContent(
        key: passwordFormKey,
        form: PasswordFormFields(
          passwordFormKey: passwordFormKey,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          passwordFocusNode: passwordFocusNode,
          confirmPasswordFocusNode: confirmPasswordFocusNode,
        ),
      ),
    ];

    _initAnimation();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m500);

    _sizedAnimation = Tween<double>(
            begin: AppConstants.doubleZero, end: AppConstants.doubleOne)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.forward();
  }

  void _dispose() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    //dispose controllers
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    //animation
    _animationController.dispose();
  }
}
