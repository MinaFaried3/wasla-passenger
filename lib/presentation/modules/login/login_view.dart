import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/constants.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/presentation/modules/login/cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';
import 'package:wasla/presentation/widgets/animated_bear.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final RiveControllerManager riveController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode passwordFocusNode = FocusNode();

  //todo change to stateless
  @override
  void initState() {
    super.initState();
    riveController = context.read<BearAnimationCubit>().riveController;
    _checkPasswordFocused();
  }

  @override
  void deactivate() {
    super.deactivate();
    riveController.addState(BearState.lookIdle);
  }

  @override
  void dispose() {
    passwordFocusNode.removeListener(_passwordFocusNodeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.getWidthPercentage(AppSize.s3)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildLoginForm(responsive),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form buildLoginForm(ResponsiveManager responsive) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            BlocBuilder<BearAnimationCubit, BearAnimationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const LoadingIndicator(),
                  loadedSuccessfully: () =>
                      BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      _listenToSuccessOrErrorState(state);
                    },
                    child: AnimatedBear(
                      riveController: riveController,
                      responsive: responsive,
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            AppTextFormField(
              textDirection: TextDirection.ltr,
              controller: emailController,
              validator: (value) => value == '' ? "empty email" : null,
              onChanged: (value) {
                _onChangePhoneEmail(
                  value: value,
                  riveController: riveController,
                  numOfCharsChangedOn: 8,
                );
              },
            ),
            responsive.heightSpace(3),
            AppTextFormField(
              textDirection: TextDirection.ltr,
              controller: passwordController,
              isPassword: true,
              focusNode: passwordFocusNode,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () => const LoadingIndicator(),
                    orElse: () => TextButton(
                        onPressed: () {
                          _onPressedLogin();
                        },
                        child: Text(AppStrings.login.tr())));
              },
            )
          ],
        ));
  }

  void _listenToSuccessOrErrorState(LoginState state) {
    state.whenOrNull(success: (loginModel) {
      riveController.addState(BearState.success);
    }, error: (failure) {
      riveController.addState(BearState.fail);
    });
  }

  void _checkPasswordFocused() {
    passwordFocusNode.addListener(_passwordFocusNodeListener);
  }

  void _passwordFocusNodeListener() {
    if (passwordFocusNode.hasFocus) {
      riveController.addState(BearState.handsUp);
    } else if (!passwordFocusNode.hasFocus) {
      riveController.addState(BearState.handsDown);
    }
  }

  void _onPressedLogin() {
    passwordFocusNode.unfocus();

    formKey.currentState!.validate();

    context.read<LoginCubit>().login(
          phone: emailController.text,
          password: passwordController.text,
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

  void _onChangePhoneEmail({
    required String value,
    required RiveControllerManager riveController,
    required int numOfCharsChangedOn,
  }) {
    int x1 = numOfCharsChangedOn;
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
