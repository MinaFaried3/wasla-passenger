import 'package:rive/rive.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/models/login_models/rive_controller.dart';
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

  String email = "mina@gmail.com";
  String password = "1234567";

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
      if (passwordFocusNode.hasFocus)
        riveController.addState(LoginBearStates.hands_up);
      else if (!passwordFocusNode.hasFocus)
        riveController.addState(LoginBearStates.hands_down);
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  responsive.screenWidth * 0.2),
                              child: Rive(
                                artboard: riveController.riveArtBoard!,
                                fit: BoxFit.contain,
                                enablePointerEvents: true,
                                useArtboardSize: true,
                              ),
                            ))
                      else
                        SizedBox.shrink(),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                textDirection: TextDirection.ltr,
                                controller: emailController,
                                decoration: InputDecoration(),
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
                              TextButton(
                                  onPressed: () {
                                    _onPressedLogin(riveController);
                                  },
                                  child: Text("LOGIN"))
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
      if (passwordController.text == password && emailController.text == email)
        riveController.addState(LoginBearStates.success, successOrFail: true);
      else
        riveController.addState(LoginBearStates.fail, successOrFail: true);
    });
  }

  void _onChangePhoneEmail(String value, RiveControllerManager riveController) {
    if (value.isNotEmpty &&
        value.length > 16 &&
        !riveController.isLookingRight) {
      riveController.addState(LoginBearStates.Look_down_right,
          lookingRight: true);
    } else if (value.isNotEmpty &&
        value.length < 16 &&
        !riveController.isLookingLeft) {
      riveController.addState(LoginBearStates.Look_down_left,
          lookingLeft: true);
    } else if (value.isEmpty) {
      riveController.addState(LoginBearStates.look_idle);
    }
  }
}
