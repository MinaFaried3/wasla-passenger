import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/register/widgets/slide_register_form.dart';
import 'package:wasla/presentation/widgets/auth/components/auth_now.dart';
import 'package:wasla/presentation/widgets/auth/form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      form: SlideRegisterForm(riveController: riveController),
      bottomAction: AuthNow.login(),
    );
  }
}
