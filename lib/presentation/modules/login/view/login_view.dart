import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/presentation/modules/login/widgets/bear_login.dart';
import 'package:wasla/presentation/modules/login/widgets/login_form.dart';
import 'package:wasla/presentation/resources/common/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

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
  void deactivate() {
    super.deactivate();
    riveController.addState(BearState.lookIdle);
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
                  ///bear animation
                  LoginBear(riveController: riveController),

                  ///login form
                  LoginForm(
                    riveController: riveController,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
