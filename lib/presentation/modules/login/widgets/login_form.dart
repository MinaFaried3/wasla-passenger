import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/presentation/modules/login/cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

class LoginForm extends StatefulWidget {
  final RiveControllerManager riveController;

  const LoginForm({
    super.key,
    required this.riveController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _checkPasswordFocused();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    passwordFocusNode.removeListener(_passwordFocusNodeListener);
    passwordFocusNode.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  void _checkPasswordFocused() {
    passwordFocusNode.addListener(_passwordFocusNodeListener);
  }

  void _passwordFocusNodeListener() {
    if (passwordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsUp);
    } else if (!passwordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsDown);
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    return Form(
      key: formKey,
      child: Column(
        children: [
          //user name field
          AppTextFormField(
            labelText: AppStrings.userNameLabel.tr(),
            svgPrefixPath: AssetsProvider.userIcon2,
            textDirection: TextDirection.ltr,
            controller: userNameController,
            onChanged: (value) {
              _onChangePhoneEmail(
                value: value,
                riveController: widget.riveController,
              );
            },
          ),

          //space
          responsive.heightSpace(AppSize.s3),

          //password field
          BlocBuilder<PasswordIconCubit, PasswordIconState>(
            builder: (context, state) {
              return AppTextFormField(
                textDirection: TextDirection.ltr,
                controller: passwordController,
                focusNode: passwordFocusNode,
                labelText: AppStrings.passwordLabel.tr(),
                svgPrefixPath: AssetsProvider.passwordIcon2,
                isPassword: state.isClosed,
                suffix: _closedOpenIcon(
                    iconPath: state.iconPath,
                    width: responsive.getWidthOf(AppSize.s0_1)),
              );
            },
          ),

          //space
          responsive.heightSpace(AppSize.s10),

          //login button
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => LoadingIndicator(
                  height: responsive.getBodyHeightOf(AppSize.s0_2),
                ),
                orElse: () => AppButton(
                  onPressed: _onPressedLogin,
                  text: AppStrings.login.tr(),
                ),
              );
            },
          )
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
        context.read<PasswordIconCubit>().toggleOpenCloseIcon();
      },
    );
  }

  void _addLookingState({
    required String value,
    required RiveControllerManager riveController,
    int start = AppConstants.zero,
    int end = AppConstants.thousands,
    BearState wantedBearState = BearState.lookIdle,
  }) {
    if (riveController.currentState == wantedBearState) return;

    if (value.isEmpty && riveController.currentState != BearState.lookIdle) {
      riveController.addState(BearState.lookIdle);
      PrintManager.printColoredText(BearState.lookIdle.name);
      return;
    }

    int length = value.length;
    if (length >= start && length < end) {
      riveController.addState(wantedBearState);
      PrintManager.printColoredText(wantedBearState.name);
    }
  }

  void _onPressedLogin() {
    passwordFocusNode.unfocus();

    formKey.currentState!.validate();

    context.read<LoginCubit>().login(
          // phone: '01207340018',
          // password: '12345678',

          userName: userNameController.text,
          password: passwordController.text,
        );
  }

  void _onChangePhoneEmail({
    required String value,
    required RiveControllerManager riveController,
  }) {
    int x1 = 4;
    int x2 = x1 * 2;
    int x3 = x1 * 3;
    int x4 = x1 * 4;

    _addLookingState(
      value: value,
      riveController: riveController,
      end: x1,
      wantedBearState: BearState.lookLeft,
    );

    _addLookingState(
      value: value,
      riveController: riveController,
      start: x1,
      end: x2,
      wantedBearState: BearState.lookMediumLeft,
    );

    _addLookingState(
      value: value,
      riveController: riveController,
      start: x2,
      end: x3,
      wantedBearState: BearState.lookCenter,
    );

    _addLookingState(
      value: value,
      riveController: riveController,
      start: x3,
      end: x4,
      wantedBearState: BearState.lookMediumRight,
    );

    _addLookingState(
      value: value,
      riveController: riveController,
      start: x4,
      wantedBearState: BearState.lookRight,
    );
  }
}
