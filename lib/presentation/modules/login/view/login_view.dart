import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/login/widgets/login_form.dart';
import 'package:wasla/presentation/widgets/auth/components/auth_now.dart';
import 'package:wasla/presentation/widgets/auth/form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final RiveControllerManager riveController;

  @override
  void initState() {
    super.initState();
    riveController = context.read<BearAnimationCubit>().riveController;
  }

  @override
  void dispose() {
    DIModulesManger.disposeBloc<LoginCubit>();
    super.dispose();
  }

  void _listenToSuccessOrErrorState(BuildContext context, LoginState state) {
    final dialogCubit = context.read<BearDialogCubit>();

    state.whenOrNull(
      success: (loginModel) {
        _listenWhenSuccessLogin(dialogCubit, loginModel, context);
      },
      error: (failure) {
        riveController.addState(BearState.fail);
        dialogCubit.loginErrorMsg();
      },
      emptyUsername: () {
        riveController.addState(BearState.fail);
        dialogCubit.usernameFieldEmptyMsg();
      },
      emptyPassword: () {
        riveController.addState(BearState.fail);
        dialogCubit.passwordFieldEmptyMsg();
      },
      emptyUsernameAndPassword: () {
        riveController.addState(BearState.fail);
        dialogCubit.usernameAndPasswordFieldEmptyMsg();
      },
    );
  }

  void _listenWhenSuccessLogin(BearDialogCubit dialogCubit,
      PassengerModel loginModel, BuildContext context) {
    riveController.addState(BearState.success);
    dialogCubit.loginSuccessMsg(loginModel.firstName);

    Timer(DurationManager.s2, () {
      if (loginModel.connections.phoneConfirmed ||
          loginModel.connections.emailConfirmed) {
        context.pushNamedAndRemoveUntil(
          Routes.start.path,
        );
      } else {
        context.pushNamedAndRemoveUntil(
          Routes.verificationWayRoute.path,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) {
        SystemNavigator.pop();
      },
      child: AuthForm(
        riveController: riveController,
        form: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            _listenToSuccessOrErrorState(context, state);
          },
          child: LoginForm(riveController: riveController),
        ),
        bottomAction: AuthNow.register(),
      ),
    );
  }
}
