import 'dart:async';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/register/bloc/check_username_bloc.dart';
import 'package:wasla/presentation/modules/register/widgets/contacts_form_fields.dart';
import 'package:wasla/presentation/modules/register/widgets/names_form_fields.dart';
import 'package:wasla/presentation/modules/register/widgets/password_form_fields.dart';

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
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode lastnameFocusNode = FocusNode();

  //form keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> contactsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  late final List<GlobalKey<FormState>> formsKeys;

  late final List<Widget> forms;

  late int formIndex = 0;

  @override
  void initState() {
    super.initState();
    formsKeys = [namesFormKey, contactsFormKey, passwordFormKey];

    forms = [
      NamesFormFields(
        namesFormKey: namesFormKey,
        usernameController: usernameController,
        lastnameController: lastnameController,
        firstnameController: firstnameController,
        lastnameFocusNode: lastnameFocusNode,
        usernameFocusNode: usernameFocusNode,
      ),
      ContactsFormFields(contactsFormKey: contactsFormKey),
      PasswordFormFields(passwordFormKey: passwordFormKey),
    ];

    _addFocusNodesListeners();
    _initAnimation();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m750);

    _sizedAnimation = Tween<double>(
            begin: AppConstants.doubleZero, end: AppConstants.doubleOne)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //container padding and radius
    const double containerPadding = AppPadding.p8;
    const double containerRadius = containerPadding + AppSize.s20;

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_02);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);

    //return
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
            color: ColorsManager.darkTeal,
            borderRadius: BorderRadius.circular(containerRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            forms[formIndex],
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (formIndex > 0) {
              setState(() {
                formIndex--;
              });
            }
          },
          icon: SvgPicture.asset(
            AssetsProvider.arrowLeftIcon,
            colorFilter: const ColorFilter.mode(
              ColorsManager.tealPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(
          '${formIndex + 1} / ${forms.length}',
          textDirection: TextDirection.ltr,
        ),
        IconButton(
            onPressed: () {
              if (formsKeys[formIndex].currentState!.validate() == false) {
                context
                    .read<BearDialogCubit>()
                    .writeMessage(AppStrings.makeSureToGoNext);
                widget.riveController.addState(BearState.fail);

                return;
              }
              if (formIndex == 0) {
                if (!_validateNamesForm()) {
                  return;
                }
              }
              if (formIndex < forms.length - 1) {
                setState(() {
                  formIndex++;
                  print(formIndex);
                });
              }
            },
            icon: SvgPicture.asset(
              AssetsProvider.arrowRightIcon,
              colorFilter: const ColorFilter.mode(
                ColorsManager.tealPrimary,
                BlendMode.srcIn,
              ),
            )),
      ],
    );
  }

  void _onPressedLogin() async {
    passwordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
    usernameFocusNode.unfocus();
    await _addDelay();
    formKey.currentState!.validate();
    if (context.mounted) {
      context.read<LoginCubit>().login(
            userName: usernameController.text,
            password: passwordController.text,
          );
    }
  }

  Future<void> _addDelay() async {
    if ((usernameController.text.isEmpty || passwordController.text.isEmpty) &&
        widget.riveController.currentState == BearState.handsUp) {
      await Future.delayed(DurationManager.bearHandsDownDuration);
    }
  }

  //todo
  void _dispose() {
    //animation
    _animationController.dispose();

    //remove listener
    passwordFocusNode.removeListener(_passwordFocusNodeListener);
    usernameFocusNode.removeListener(_usernameListener);
    lastnameFocusNode.removeListener(_lastnameListener);

    //dispose nodes
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    lastnameFocusNode.dispose();

    //dispose controllers
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  void _addFocusNodesListeners() {
    passwordFocusNode.addListener(_passwordFocusNodeListener);
    usernameFocusNode.addListener(_usernameListener);
    lastnameFocusNode.addListener(_lastnameListener);
  }

  void _passwordFocusNodeListener() {
    if (passwordFocusNode.hasFocus || confirmPasswordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsUp);
    } else if (!passwordFocusNode.hasFocus ||
        !confirmPasswordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsDown);
    }
  }

  void _usernameListener() {
    if (usernameFocusNode.hasFocus) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.usernameInfo);
    }
  }

  void _lastnameListener() {
    if (lastnameFocusNode.hasFocus) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.lastnameInfo);
    }
  }

  bool _validateNamesForm() {
    return context.read<CheckUsernameBloc>().valid;
  }
}
