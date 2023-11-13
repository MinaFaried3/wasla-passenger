import 'package:rive/rive.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/presentation/modules/login/cubit/bear_login_animation_cubit.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "01207340018";
  String password = "12345678";

  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    checkPasswordFocused();
  }

  void checkPasswordFocused() {
    final riveController =
        context.read<BearLoginAnimationCubit>().riveController;
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        riveController.addState(LoginBearState.handsUp);
      } else if (!passwordFocusNode.hasFocus) {
        riveController.addState(LoginBearState.handsDown);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    final riveController =
        context.read<BearLoginAnimationCubit>().riveController;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.getWidthPercentage(3)),
          child: Center(
            child: SingleChildScrollView(
              child:
                  BlocBuilder<BearLoginAnimationCubit, BearLoginAnimationState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state is BearAssetLoaded)
                        CircleAvatar(
                            radius: responsive.screenWidth * 0.3,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    responsive.screenWidth * 0.3),
                                child: Transform(
                                  transform: Matrix4.translation(Vector3(
                                      0.0,
                                      ((responsive.screenWidth * 0.3) * 2) *
                                          0.1,
                                      0.0)),
                                  child: ClipPath(
                                    clipper: DownClipper(),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Rive(
                                        artboard: riveController.riveArtBoard!,
                                        fit: BoxFit.contain,
                                        enablePointerEvents: true,
                                        useArtboardSize: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      else
                        const SizedBox.shrink(),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: emailController,
                                decoration: const InputDecoration(),
                                validator: (value) =>
                                    value != email ? "Wrong email" : null,
                                onChanged: (value) {
                                  _onChangePhoneEmail(value, riveController);
                                },
                              ),
                              SizedBox(
                                height: responsive.getScreenHeightPercentage(3),
                              ),
                              TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: passwordController,
                                obscureText: true,
                                focusNode: passwordFocusNode,
                              ),
                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                      loading: () => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                      success: (loginModel) =>
                                          Text(loginModel.email),
                                      orElse: () => TextButton(
                                          onPressed: () {
                                            _onPressedLogin(riveController);
                                            context.read<LoginCubit>().login(
                                                phone: email,
                                                password: password);
                                          },
                                          child: const Text("LOGIN")));
                                },
                              )
                            ],
                          )),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPressedLogin(RiveControllerManager riveController) {
    passwordFocusNode.unfocus();
    Future.delayed(const Duration(seconds: 1), () {
      if (passwordController.text == password &&
          emailController.text == email) {
        riveController.addState(LoginBearState.success);
      } else {
        riveController.addState(LoginBearState.fail);
      }
    });
  }

  //TODO SRP
  void _onChangePhoneEmail(String value, RiveControllerManager riveController) {
    if (value.isNotEmpty &&
        value.length >= 40 &&
        riveController.currentState != LoginBearState.lookRight) {
      riveController.addState(
        LoginBearState.lookRight,
      );
      PrintManager.printColoredText(LoginBearState.lookRight.name);
    } else if (value.isNotEmpty &&
        (value.length >= 30 && value.length < 40) &&
        riveController.currentState != LoginBearState.lookMediumRight) {
      riveController.addState(
        LoginBearState.lookMediumRight,
      );
      PrintManager.printColoredText(LoginBearState.lookMediumLeft.name);
    } else if (value.isNotEmpty &&
        (value.length >= 20 && value.length < 30) &&
        riveController.currentState != LoginBearState.lookCenter) {
      riveController.addState(
        LoginBearState.lookCenter,
      );
      PrintManager.printColoredText(LoginBearState.lookCenter.name);
    } else if (value.isNotEmpty &&
        (value.length >= 10 && value.length < 20) &&
        riveController.currentState != LoginBearState.lookMediumLeft) {
      riveController.addState(
        LoginBearState.lookMediumLeft,
      );
      PrintManager.printColoredText(LoginBearState.lookMediumLeft.name);
    } else if (value.isNotEmpty &&
        value.length < 10 &&
        riveController.currentState != LoginBearState.lookLeft) {
      riveController.addState(
        LoginBearState.lookLeft,
      );
      PrintManager.printColoredText(
          "${LoginBearState.lookLeft.name} ${riveController.currentState != LoginBearState.lookLeft}");
    } else if (value.isEmpty) {
      riveController.addState(LoginBearState.lookIdle);
    }
  }
}

//TODO
class DownClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(0, size.height * 0.9);
    path.lineTo(0, 0);

    return path;
  }
}
