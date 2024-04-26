import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
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
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  });

  final FocusNode passwordFocusNode;

  final FocusNode confirmPasswordFocusNode;

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
    final responsive = ContextManager(context, hasAppBar: false);

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
                  focusNode: widget.passwordFocusNode,
                  textDirection: TextDirection.ltr,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.visiblePassword,
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
              focusNode: widget.confirmPasswordFocusNode,
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
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
    widget.passwordFocusNode.requestFocus();

    context.read<BearDialogCubit>().writeMessage(AppStrings.passwordInfo.tr());

    _initAnimation();

    widget.passwordFocusNode.addListener(_passwordListener);
    widget.confirmPasswordFocusNode.addListener(_confirmPasswordListener);
  }

  void _dispose() {
    widget.passwordFocusNode.unfocus();
    widget.confirmPasswordFocusNode.unfocus();

    widget.passwordFocusNode.removeListener(_passwordListener);
    widget.confirmPasswordFocusNode.removeListener(_confirmPasswordListener);

    _animationController.dispose();
  }

  void _passwordListener() {
    if (widget.passwordFocusNode.hasFocus) {
      _focus();
    } else {
      _unFocus();
    }
  }

  void _confirmPasswordListener() {
    if (widget.confirmPasswordFocusNode.hasFocus) {
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

    context.read<BearDialogCubit>().writeMessage(AppStrings.passwordInfo.tr());
  }

  void _unFocus() {
    context
        .read<BearAnimationCubit>()
        .riveController
        .addState(BearState.handsDown);

    context
        .read<BearDialogCubit>()
        .writeMessage(AppStrings.makeSureToGoNext.tr());
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
