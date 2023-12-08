import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';

class PasswordFormFields extends StatefulWidget {
  const PasswordFormFields({
    super.key,
    required this.passwordFormKey,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final GlobalKey<FormState> passwordFormKey;

  @override
  State<PasswordFormFields> createState() => _PasswordFormFieldsState();
}

class _PasswordFormFieldsState extends State<PasswordFormFields>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizedAnimation;

  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  late double _scale;

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
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_03);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);
    return Form(
      key: widget.passwordFormKey,
      child: Column(
        children: [
          //password field
          BlocBuilder<PasswordIconCubit, PasswordIconState>(
            builder: (context, state) {
              return Padding(
                padding: edgeInsetsBottom,
                child: AppTextFormField(
                  controller: widget.passwordController,
                  focusNode: passwordFocusNode,
                  textDirection: TextDirection.ltr,
                  textInputAction: TextInputAction.next,
                  labelText: AppStrings.password.tr(),
                  svgPrefixPath: AssetsProvider.passwordIcon,
                  validator: _passwordValidator,
                  isPassword: state.isClosed,
                  suffix: FadeTransition(
                    opacity: _sizedAnimation,
                    child: _closedOpenIcon(
                        iconPath: state.iconPath,
                        width: responsive.getWidthOf(AppSize.s0_1)),
                  ),
                ),
              );
            },
          ),

          //confirm password field
          Padding(
            padding: edgeInsetsBottom,
            child: AppTextFormField(
              controller: widget.confirmPasswordController,
              focusNode: confirmPasswordFocusNode,
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.done,
              labelText: AppStrings.confirmPassword.tr(),
              svgPrefixPath: AssetsProvider.passwordIcon,
              isPassword: true,
              validator: _confirmPasswordValidator,
              onChanged: _onChangedConfirmPassword,
              suffix: AnimatedScale(
                duration: DurationManager.m500,
                scale: _scale,
                child: SvgPicture.asset(
                  AssetsProvider.doneIcon,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    ColorsManager.tealPrimary300.withOpacity(AppSize.s0_9),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
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

  String? _passwordValidator(String? password) {
    if (password == null ||
        password.isEmpty ||
        widget.passwordController.text.isEmpty) {
      return AppStrings.cannotBeEmpty.tr();
    }

    if (password.length < AppConstants.minPasswordLength) {
      return AppStrings.passwordLengthInvalid.tr();
    }

    final validPassword =
        const PasswordSubmitRegexValidator().isValid(password);

    if (!validPassword) {
      return AppStrings.passwordInvalid.tr();
    }

    return null;
  }

  String? _confirmPasswordValidator(String? confirmPassword) {
    if (confirmPassword == null ||
        confirmPassword.isEmpty ||
        widget.confirmPasswordController.text.isEmpty) {
      return AppStrings.cannotBeEmpty.tr();
    }

    final validConfirmPassword =
        confirmPassword == widget.passwordController.text;

    if (!validConfirmPassword) {
      return AppStrings.confirmPasswordInvalid.tr();
    }

    return null;
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m750);

    _sizedAnimation = Tween<double>(
            begin: AppConstants.doubleZero, end: AppConstants.doubleOne)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.forward();

    if (widget.passwordController.text.isNotEmpty &&
        widget.passwordController.text ==
            widget.confirmPasswordController.text) {
      _scale = AppConstants.doubleOne;
    } else {
      _scale = AppConstants.doubleZero;
    }
  }

  void _init() {
    passwordFocusNode.requestFocus();

    context.read<BearDialogCubit>().writeMessage(AppStrings.passwordInfo);

    _initAnimation();

    passwordFocusNode.addListener(_passwordListener);
    confirmPasswordFocusNode.addListener(_confirmPasswordListener);
  }

  void _dispose() {
    passwordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();

    passwordFocusNode.removeListener(_passwordListener);
    confirmPasswordFocusNode.removeListener(_confirmPasswordListener);

    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    _animationController.dispose();
  }

  Future<void> _addDelay() async {
    if (context.read<BearAnimationCubit>().riveController.currentState ==
        BearState.handsUp) {
      await Future.delayed(DurationManager.bearHandsDownDuration);
    }
  }

  void _passwordListener() {
    if (passwordFocusNode.hasFocus) {
      _focus();
    } else {
      _unFocus();
    }
  }

  void _confirmPasswordListener() {
    if (confirmPasswordFocusNode.hasFocus) {
      _focus();
    } else {
      _unFocus();
    }
  }

  void _focus() {
    context
        .read<BearAnimationCubit>()
        .riveController
        .addState(BearState.handsUp);

    context.read<BearDialogCubit>().writeMessage(AppStrings.passwordInfo);
  }

  void _unFocus() {
    context
        .read<BearAnimationCubit>()
        .riveController
        .addState(BearState.handsDown);

    context.read<BearDialogCubit>().writeMessage(AppStrings.makeSureToGoNext);
  }

  void _onChangedConfirmPassword(String password) {
    setState(() {
      if (password == widget.passwordController.text) {
        _scale = AppConstants.doubleOne;
      } else {
        _scale = AppConstants.doubleZero;
      }
    });
  }
}
