import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/presentation/resources/common/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';
import 'package:wasla/presentation/widgets/animated_bear.dart';

class LoginBear extends StatelessWidget {
  final RiveControllerManager riveController;

  const LoginBear({super.key, required this.riveController});

  void _listenToSuccessOrErrorState(LoginState state) {
    state.whenOrNull(success: (loginModel) {
      riveController.addState(BearState.success);
    }, error: (failure) {
      riveController.addState(BearState.fail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BearAnimationCubit, BearAnimationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingIndicator(),
          loadedSuccessfully: () => BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              _listenToSuccessOrErrorState(state);
            },
            child: AnimatedBear(
              riveController: riveController,
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
