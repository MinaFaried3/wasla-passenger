import 'dart:async';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/login/widgets/forget_password_button.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';

class LoginForm extends StatefulWidget {
  final RiveControllerManager riveController;

  const LoginForm({
    super.key,
    required this.riveController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizedAnimation;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
    const double containerPadding = AppPadding.p8;
    const double containerRadius = containerPadding + AppSize.s20;
    const double paddingBottom = AppPadding.p20;
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
            //user name field
            Padding(
              padding: const EdgeInsets.only(bottom: paddingBottom),
              child: AppTextFormField(
                labelText:
                    '${AppStrings.username.tr()}-${AppStrings.email1.tr()}',
                svgPrefixPath: AssetsProvider.emailIcon,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textDirection: TextDirection.ltr,
                controller: usernameController,
                focusNode: usernameFocusNode,
                autofillHints: const [AutofillHints.email],
                onChanged: (value) {
                  widget.riveController.followFieldText(
                    value: value,
                  );
                },
              ),
            ),

            //password field
            BlocBuilder<PasswordIconCubit, PasswordIconState>(
              builder: (context, state) {
                return AppTextFormField(
                  textDirection: TextDirection.ltr,
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  labelText: AppStrings.password.tr(),
                  svgPrefixPath: AssetsProvider.passwordIcon,
                  isPassword: state.isClosed,
                  suffix: FadeTransition(
                    opacity: _sizedAnimation,
                    child: _closedOpenIcon(
                        iconPath: state.iconPath,
                        width: responsive.getWidthOf(AppSize.s0_1)),
                  ),
                );
              },
            ),

            //forget password Text
            const ForgetPasswordButton(
              containerPadding: containerPadding,
              paddingBottom: paddingBottom,
            ),

            //login button
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () => LoadingButton.loading(),
                    orElse: () => LoadingButton(
                        text: AppStrings.login.tr(),
                        onPressed: _onPressedLogin));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _closedOpenIcon({required String iconPath, required double width}) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        width: width,
        colorFilter: ColorFilter.mode(
          ColorsManager.offWhite300.withOpacity(AppSize.s0_9),
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {
        _animationController.reset();
        _animationController.forward();

        context.read<PasswordIconCubit>().toggleOpenCloseIcon();
      },
    );
  }

  void _onPressedLogin() async {
    passwordFocusNode.unfocus();
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

  void _dispose() {
    //animation
    _animationController.dispose();

    //remove listener
    passwordFocusNode.removeListener(_passwordFocusNodeListener);
    usernameFocusNode.removeListener(_usernameFocusNodeListener);
    //dispose nodes
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
    //dispose controllers
    usernameController.dispose();
    passwordController.dispose();
  }

  void _addFocusNodesListeners() {
    passwordFocusNode.addListener(_passwordFocusNodeListener);
    usernameFocusNode.addListener(_usernameFocusNodeListener);
  }

  void _passwordFocusNodeListener() {
    if (passwordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsUp);
    } else if (!passwordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsDown);
    }
  }

  void _usernameFocusNodeListener() {
    if (usernameFocusNode.hasFocus) {
      context.read<BearDialogCubit>().usernameFieldFocusedMsg();
    }
  }
}
