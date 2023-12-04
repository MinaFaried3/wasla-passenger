import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
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
  Widget build(BuildContext context) {
    return AuthForm(
      riveController: riveController,
      form: LoginForm(riveController: riveController),
      bottomAction: AuthNow.register(),
    );
  }
}
