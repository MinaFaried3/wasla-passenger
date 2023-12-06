import 'dart:async';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/register/widgets/names_widget.dart';

class RegisterForm extends StatefulWidget {
  final RiveControllerManager riveController;

  const RegisterForm({
    super.key,
    required this.riveController,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizedAnimation;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();

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
            //name fields (first and last)
            Padding(
              padding: edgeInsetsBottom,
              child: NamesFields(
                lastnameFocusNode: FocusNode(),
                firstnameController: TextEditingController(),
                lastnameController: TextEditingController(),
              ),
            ),

            //username filed
            Padding(
              padding: edgeInsetsBottom,
              child: AppTextFormField(
                textDirection: TextDirection.ltr,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                labelText: AppStrings.username.tr(),
                svgPrefixPath: AssetsProvider.userIcon,
                suffix: FadeTransition(
                    opacity: _sizedAnimation,
                    child: SvgPicture.asset(
                      AssetsProvider.doneIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorsManager.offWhite300.withOpacity(AppSize.s0_9),
                        BlendMode.srcIn,
                      ),
                    )),
              ),
            ),

            //email filed
            Padding(
              padding: edgeInsetsBottom,
              child: AppTextFormField(
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.next,
                labelText: AppStrings.email.tr(),
                svgPrefixPath: AssetsProvider.emailIcon,
              ),
            ),

            //email filed
            Padding(
              padding: edgeInsetsBottom,
              child: AppTextFormField(
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.next,
                labelText: AppStrings.phone.tr(),
                svgPrefixPath: AssetsProvider.phoneIcon,
              ),
            ),

            //password field
            Padding(
              padding: edgeInsetsBottom,
              child: AppTextFormField(
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.done,
                focusNode: passwordFocusNode,
                labelText: AppStrings.password.tr(),
                svgPrefixPath: AssetsProvider.passwordIcon,
                isPassword: true,
              ),
            ),

            //confirm password field
            Padding(
              padding: edgeInsetsBottom,
              child: AppTextFormField(
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.done,
                focusNode: confirmPasswordFocusNode,
                labelText: AppStrings.confirmPassword.tr(),
                svgPrefixPath: AssetsProvider.passwordIcon,
                isPassword: true,
                suffix: FadeTransition(
                    opacity: _sizedAnimation,
                    child: SvgPicture.asset(
                      AssetsProvider.doneIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorsManager.offWhite300.withOpacity(AppSize.s0_9),
                        BlendMode.srcIn,
                      ),
                    )),
              ),
            ),

            //login button
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder: (child, animation) => SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.horizontal,
                    child: child,
                  ),
                  child: state.maybeWhen(
                    loading: () => LoadingIndicator(
                      height: responsive.getBodyHeightOf(AppSize.s0_2),
                    ),
                    orElse: () => AppButton(
                      onPressed: _onPressedLogin,
                      text: AppStrings.createAccount.tr(),
                    ),
                  ),
                );
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

  void _dispose() {
    //animation
    _animationController.dispose();

    //remove listener
    passwordFocusNode.removeListener(_passwordFocusNodeListener);
    usernameFocusNode.removeListener(_usernameFocusNodeListener);
    //dispose nodes
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    //dispose controllers
    usernameController.dispose();
    passwordController.dispose();
  }

  void _addFocusNodesListeners() {
    passwordFocusNode.addListener(_passwordFocusNodeListener);
    usernameFocusNode.addListener(_usernameFocusNodeListener);
  }

  void _passwordFocusNodeListener() {
    if (passwordFocusNode.hasFocus || confirmPasswordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsUp);
    } else if (!passwordFocusNode.hasFocus ||
        !confirmPasswordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsDown);
    }
  }

  void _usernameFocusNodeListener() {
    if (usernameFocusNode.hasFocus) {
      context.read<BearDialogCubit>().usernameFieldFocusedMsg();
    }
  }
}
